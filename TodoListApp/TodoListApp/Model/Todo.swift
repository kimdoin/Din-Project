import UIKit

struct Todo: Codable, Equatable {
    let id: Int
    var isDone: Bool
    var detail: String
    var isToday: Bool
    
    mutating func update(isDone: Bool, detail: String, isToday: Bool) {
        self.isDone = isDone
        self.detail = detail
        self.isToday = isToday
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

class TodoManager { // 관리자
    static let shared = TodoManager() // 싱글톤 객체
    // 앱 내에서 여러개가 아니라 한개가 있고 그 한개가 여러번 여기저기서 불리면 되겠다 할때 싱글톤 객체를 만든다.
    
    static var lastId: Int = 0
    
    var todos: [Todo] = []
    
    func createTodo(detail: String, isToday: Bool) -> Todo {
        // 새로운 Todo를 만들기 위해서는 다음 아이디를 알아야함
        let nextId = TodoManager.lastId + 1
        TodoManager.lastId = nextId
        return Todo(id: nextId, isDone: false, detail: detail, isToday: isToday)
    }
    
    func addTodo(_ todo: Todo) {
        todos.append(todo)
        saveTodo() // 싱크
    }
    
    func deleteTodo(_ todo: Todo) {
        
        todos = todos.filter{ $0.id != todo.id }
        saveTodo()
        
//        if let index = todos.firstIndex(of: todo) {
//            todos.remove(at: index)
//        }
    }
    
    func updateTodo(_ todo: Todo) {
        guard let index = todos.firstIndex(of: todo) else { return }
        todos[index].update(isDone: todo.isDone, detail: todo.detail, isToday: todo.isToday)
        saveTodo()
    }
    
    func saveTodo() {
        
    }
    
    func retrieveTodo() {
        
    }
    
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

