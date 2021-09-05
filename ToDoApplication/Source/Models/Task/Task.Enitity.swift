//
//  Task.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation

struct Task: Decodable, Hashable, Identifiable {
    var id: String
    
    var title: String
    var content: String
}
