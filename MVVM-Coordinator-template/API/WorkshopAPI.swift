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


class WorkshopAPI {


    private var infinity: Bool = true
    public func fetchRecipes(page: Int, count: Int, completion: @escaping (_ items: [Recipe])->()) {

        if self.infinity  {
            let base_url: String = BASE_URL + String(page) + "&count=" + String(count)
            var result:[Recipe] = []

            Alamofire.request(base_url).responseJSON { response in
                guard response.result.isSuccess else {
                    print("Ошибка при запросе данных \(String(describing: response.result.error))")
                    return
                }
                for (index, item) in JSON(response.value)["recipes"] {
                    var recipe = Recipe(isLiked: item["isLiked"].boolValue, isNew: item["isNew"].boolValue, commentCount: item["commentCount"].intValue, imageUrl: item["imageUrl"].stringValue, likeCount: item["likeCount"].intValue, title: item["title"].stringValue, author: item["author"].stringValue, timing: item["timing"].intValue, guid: item["guid"].stringValue)
                    result.append(recipe)
                }
                self.infinity = !result.isEmpty
                completion(result)
            }
        } else {
            completion([])
        }

    }
}
