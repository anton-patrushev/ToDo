//
//  PersistedTask.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 22.08.21.
//

import Foundation

import Foundation

struct PersistedTask: Decodable, Hashable, Identifiable {
    var id: String
    
    var title: String
    var content: String
    
    // Just to show difference
    var persistKey: String
}
