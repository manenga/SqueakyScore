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
        self.activeTodo = try container.decode(Bool.self, forKey: .activeTodo)
        self.activeChat = try container.decode(Bool.self, forKey: .activeChat)
        self.numberOfTodoItems = try container.decode(Int.self, forKey: .numberOfTodoItems)
        self.numberOfCompletedTodoItems = try container.decode(Int.self, forKey: .numberOfCompletedTodoItems)
        self.selected = try container.decode(Bool.self, forKey: .selected)
    }
}
