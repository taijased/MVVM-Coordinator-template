//
//  User.swift
//  MVVM-Coordinator-template
//
//  Created by Maxim Spiridonov on 04/03/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//


class User {
    var name: String
    var login: String
    var followers: Int
    var following: Int
    init(name: String, login: String, followers: Int, following: Int) {
        self.name = name
        self.login = login
        self.followers = followers
        self.following = following
    }
}
