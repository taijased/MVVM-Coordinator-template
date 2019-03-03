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
}
