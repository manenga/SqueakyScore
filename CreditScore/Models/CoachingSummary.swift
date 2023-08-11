//
//  CoachingSummary.swift
//  CreditScore
//
//  Created by Manenga Mungandi on 2023/08/11.
//

import Foundation

struct CoachingSummary: Codable {
    let activeTodo, activeChat: Bool
    let numberOfTodoItems, numberOfCompletedTodoItems: Int
    let selected: Bool

    enum CodingKeys: String, CodingKey {
        case activeTodo, activeChat
        case numberOfTodoItems, numberOfCompletedTodoItems
        case selected
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.activeTodo = try container.decodeIfPresent(Bool.self, forKey: .activeTodo) ?? false
        self.activeChat = try container.decodeIfPresent(Bool.self, forKey: .activeChat) ?? false
        self.numberOfTodoItems = try container.decodeIfPresent(Int.self, forKey: .numberOfTodoItems) ?? .zero
        self.numberOfCompletedTodoItems = try container.decodeIfPresent(Int.self, forKey: .numberOfCompletedTodoItems) ?? .zero
        self.selected = try container.decodeIfPresent(Bool.self, forKey: .selected) ?? false
    }

    init(activeTodo: Bool,
         activeChat: Bool,
         numberOfTodoItems: Int,
         numberOfCompletedTodoItems: Int,
         selected: Bool) {
        self.activeTodo = activeTodo
        self.activeChat = activeChat
        self.numberOfTodoItems = numberOfTodoItems
        self.numberOfCompletedTodoItems = numberOfCompletedTodoItems
        self.selected = selected
    }
}
