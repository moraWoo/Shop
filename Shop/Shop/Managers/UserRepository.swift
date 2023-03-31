import CoreData
import Combine
import UIKit

class UserRepository: ObservableObject, UserRepositoryProtocol {
    
    @Published var firstName: String?
    
    private let coreDataManger: CoreDataManager
    private var cancellables: Set<AnyCancellable> = []
    
    var currentUser: User? {
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isLogged == %@", NSNumber(value: true))
        do {
            let users = try coreDataManger.persistentContainer.viewContext.fetch(fetchRequest)
            return users.first
        } catch {
            print("Failed to fetch logged in user: \(error)")
            return nil
        }
    }
    
    init(coreDataManager: CoreDataManager = CoreDataManager.shared) {
        
        self.coreDataManger = coreDataManager
    }
    
    func createUser(firstName: String, lastName: String, email: String, password: String) -> AnyPublisher<Bool, Never> {
        
        let newUser = User(context: coreDataManger.persistentContainer.viewContext)
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.email = email
        newUser.password = "123"
        newUser.isLogged = true
        
        do {
            try coreDataManger.persistentContainer.viewContext.save()
            return Just(true).eraseToAnyPublisher()
        } catch {
            print("Error creating user: \(error)")
            return Just(false).eraseToAnyPublisher()
        }
    }
    
    func checkUser(firstName: String, lastName: String? = nil, email: String? = nil, password: String? = nil) -> AnyPublisher<User?, Never> {
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        var predicates: [NSPredicate] = [NSPredicate(format: "firstName == %@", firstName)]
        
        if let lastName = lastName {
            predicates.append(NSPredicate(format: "lastName == %@", lastName))
        }
        
        if let email = email {
            predicates.append(NSPredicate(format: "email == %@", email))
        }
        
        if let password = password, !password.isEmpty {
            predicates.append(NSPredicate(format: "password == %@", password))
        }
        
        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        
        do {
            let result = try coreDataManger.persistentContainer.viewContext.fetch(fetchRequest)
            if let user = result.first {
                DispatchQueue.main.async {
                    self.firstName = user.firstName
                }
            }
            return Just(result.first).eraseToAnyPublisher()
        } catch {
            print("Error fetching user: \(error)")
            return Just(nil).eraseToAnyPublisher()
        }
    }
    
    func setIsLogged(user: User, isLogged: Bool) {
        
        user.isLogged = isLogged
        do {
            try coreDataManger.persistentContainer.viewContext.save()
        } catch {
            print("Error updating user isLogged status: \(error)")
        }
    }
    
    func fetchLoggedInUser() -> AnyPublisher<User?, Never> {
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isLogged == true")
        do {
            let result = try coreDataManger.persistentContainer.viewContext.fetch(fetchRequest)
            return Just(result.first).eraseToAnyPublisher()
        } catch {
            print("Error fetching logged in user: \(error)")
            return Just(nil).eraseToAnyPublisher()
        }
    }
    
    func saveContext() {
        
        do {
            try coreDataManger.persistentContainer.viewContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    func updateAvatar(user: User, avatar: UIImage) {
        
        if let data = avatar.jpegData(compressionQuality: 1.0) {
            user.avatar = data
            saveContext()
        }
    }
    
    func fetchAvatar() -> AnyPublisher<UIImage?, Never> {
        
        guard let currentUser = currentUser else {
            return Just(nil).eraseToAnyPublisher()
        }

        if let avatarData = currentUser.avatar {
            if let uiImage = UIImage(data: avatarData) {
                return Just(uiImage).eraseToAnyPublisher()
            } else {
                print("Error converting avatar data to UIImage")
                return Just(nil).eraseToAnyPublisher()
            }
        } else {
            return Just(nil).eraseToAnyPublisher()
        }
    }

}

