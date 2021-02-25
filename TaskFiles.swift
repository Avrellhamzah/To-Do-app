//
//  File.swift
//  ToDoApp
//
//
//  Created by Macboook on 19/02/21.
//

import Foundation

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable {
    var id = String()
    var toDoItem = String()
    
}

class TaskStore : ObservableObject {
    @Published var tasks = [Task]()
        
}
