//
//  PersonFollowingTableViewCellViewModel.swift
//  MVVM_Example
//
//  Created by Akanksha pakhale on 15/09/21.
//

import UIKit

struct PersonFollowingTableViewCellViewModel {
    let name: String
    let username: String?
    var currentlyFollowing: Bool
    let image: UIImage
    
    init(with model: Person) {
        name = model.name!
        username = model.username
        currentlyFollowing = false
        image = UIImage(systemName: "person")!
    }
    
}
