//
//  UserModel.swift
//  music
//
//  Created by Yu Mao on 4/11/25.
//
import SwiftData

@Model
final class UserModel {
    var username:String
    var userId: Int
    var avatarUrl: String
    
    init(username: String, userId: Int, avatarUrl: String) {
        self.username = username
        self.userId = userId
        self.avatarUrl = avatarUrl
    }
}
