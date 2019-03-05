//
//  Recipe.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 03/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

class Recipe {
    var isLiked: Bool
    var isNew: Bool
    var commentCount: Int
    var imageUrl: String
    var likeCount: Int
    var title: String
    var author: String
    var timing: Int
    var guid: String
    init(isLiked: Bool, isNew: Bool, commentCount: Int, imageUrl: String, likeCount: Int, title: String, author: String, timing: Int, guid: String) {
        self.isLiked = isLiked
        self.isNew = isNew
        self.commentCount = commentCount
        self.imageUrl = imageUrl
        self.likeCount = likeCount
        self.title = title
        self.author = author
        self.timing = timing
        self.guid = guid
    }
    
    static func initialize(from json: [String: Any]) -> Recipe?{
        guard
            let isLiked = json["isLiked"] as? Bool,
            let isNew = json["isNew"] as? Bool,
            let commentCount = json["commentCount"] as? Int,
            let imageUrl = json["imageUrl"] as? String,
            let likeCount = json["likeCount"] as? Int,
            let title = json["title"] as? String,
            let author = json["author"] as? String,
            let timing = json["timing"] as? Int,
            let guid = json["guid"] as? String
            else { return nil }
        
        return Recipe(isLiked: isLiked, isNew: isNew, commentCount: commentCount, imageUrl: imageUrl, likeCount: likeCount, title: title, author: author, timing: timing, guid: guid)
    }
}
