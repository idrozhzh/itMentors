//
//  Mentor.swift
//  itMentors
//
//  Created by Иван Дрожжин on 26.07.2022.
//

import Foundation

struct Mentor {
    let name: String
    let surname: String
    
    let city: String
    let scope: String
    
    let reviews: [Review]
    let students: [Student]
    
    var fullname: String {
        "\(name) \(surname)"
    }
}

struct Review {
    let reviewerName: String
    let rating: Int
    let text: String
}

struct Student {
    let name: String
    let surname: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
}
