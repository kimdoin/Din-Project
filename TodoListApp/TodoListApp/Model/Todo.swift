import UIKit

struct Todo: Codable, Equatable {
    let id: Int
    var isDone: Bool
    var detail: String
    var isToday: Bool
    
    mutating func update(isDone: Bool, detail: String, isToday: Bool) {
        
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return true
    }
}

class TodoManager {
    static let shared = TodoManager()
    
    static var lastId: Int = 0
    
    var todos: [Todo] = []
    
    
}

class TodoViewModel {
    enum Section: Int, CaseIterable {
        case today
        case Upcoming
        
        var title: String {
            switch self {
            case .today:
                return "Today"
            default:
                return "Upcoming"
            }
        }
    }
    
    
}

