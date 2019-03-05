//
//  WorkshopAPI.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit
import RxSwift

enum ServiceError: Error {
    case cannotParse
}

class WorkshopAPI {

    private let session: URLSession

    private var infinity: Bool = true
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
//    public func fetchRecipes3(page: Int, count: Int, completion: @escaping (_ items: [Recipe])->()){
//
//        let recipe = [Recipe(isLiked: true, isNew: true, commentCount: 34, imageUrl: "", likeCount: 42, title: "Стулья Тимура", author: "Тимур Загиров", timing: 69, guid: "alogdanm"),
//                     Recipe(isLiked: true, isNew: true, commentCount: 34, imageUrl: "", likeCount: 42, title: "Диваны", author: "Имашев Александр", timing: 69, guid: "alogdanm"),
//                              Recipe(isLiked: true, isNew: true, commentCount: 34, imageUrl: "", likeCount: 42, title: "Шкафы", author: "Спиридонов Максим", timing: 69, guid: "alogdanm")]
//        completion(recipe)
//    }
    public func fetchRecipes2(page: Int, count: Int) -> Observable<[Recipe]>{
                let base_url: String = BASE_URL + String(page) + "&count=" + String(count)

//        let base_url: String = "https://api.github.com/search/repositories?q=language:Swift&sort=stars"
        let url = URL(string: base_url)!
        print("fetch2-1")
        return session.rx
            .json(url: url)
            .flatMap { json throws -> Observable<[Recipe]> in
                print(json)
                guard
                    let json = json as? [String: Any],
                    let itemsJSON = json["recipes"] as? [[String: Any]]
                    else { return Observable.error(ServiceError.cannotParse) }
                let recipes = itemsJSON.flatMap(Recipe.initialize)
                print("recipes")
                print(recipes)
                return Observable.just(recipes)
        }
    }
//
    
    public func fetchRecipes(page: Int, count: Int, completion: @escaping (_ items: [Recipe])->()){

        if self.infinity  {
            let base_url: String = BASE_URL + String(page) + "&count=" + String(count)
            var result:[Recipe] = [Recipe(isLiked: true, isNew: true, commentCount: 34, imageUrl: "", likeCount: 42, title: "Стулья Тимура", author: "Тимур Загиров", timing: 69, guid: "alogdanm")]
            Alamofire.request(base_url).responseJSON { response in
                guard response.result.isSuccess else {
                    print("Ошибка при запросе данных \(String(describing: response.result.error))")
                    return
                }
                for (_, item) in JSON(response.value!)["recipes"] {
                    let recipe = Recipe(isLiked: item["isLiked"].boolValue, isNew: item["isNew"].boolValue, commentCount: item["commentCount"].intValue, imageUrl: item["imageUrl"].stringValue, likeCount: item["likeCount"].intValue, title: item["title"].stringValue, author: item["author"].stringValue, timing: item["timing"].intValue, guid: item["guid"].stringValue)
                    result.append(recipe)
                }
                self.infinity = !result.isEmpty

                print("asdaSAs")
                completion(result)
            }
//            completion(result)
        } else {
            completion([])
        }
    }

    
    
    
}
