import Foundation
import UIKit
import CoreData
import Combine

class UserRepository: ObservableObject {
    private let coreDataManger: CoreDataManager
    private var cancellables: Set<AnyCancellable> = []

    init(coreDataManager: CoreDataManager = CoreDataManager.shared) {
        self.coreDataManger = coreDataManager
    }

    func createUser(firstName: String, lastName: String, email: String, password: String) -> AnyPublisher<Bool, Never> {
        let newUser = User(context: coreDataManger.persistentContainer.viewContext)
        newUser.firstName = firstName
        newUser.lastName = lastName
        newUser.email = email
        newUser.password = "123"

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
            return Just(result.first).eraseToAnyPublisher()
        } catch {
            print("Error fetching user: \(error)")
            return Just(nil).eraseToAnyPublisher()
        }
    }

    func saveUserAvatar(firstName: String, avatar: UIImage) -> AnyPublisher<Bool, Never> {
        let context = coreDataManger.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "firstName == %@", firstName)
        
        do {
            let result = try coreDataManger.persistentContainer.viewContext.fetch(fetchRequest)
            print("result: \(result)")
            if let user = result.first, let avatarData = avatar.jpegData(compressionQuality: 1.0) {
                user.avatar = avatarData
                try coreDataManger.persistentContainer.viewContext.save()
                return Just(true).eraseToAnyPublisher()
            } else {
                print("User not found or unable to convert avatar to data")
                return Just(false).eraseToAnyPublisher()
            }
        } catch {
            print("Error fetching user: \(error)")
            return Just(false).eraseToAnyPublisher()
        }
    }


    func loadUserAvatar(firstName: String) -> AnyPublisher<UIImage?, Never> {
        let context = coreDataManger.persistentContainer.viewContext
        let userPublisher = fetchUserByFirstName(firstName, context: context)

        return userPublisher.map { user -> UIImage? in
            if let avatarData = user?.avatar {
                return UIImage(data: avatarData)
            }
            return nil
        }.eraseToAnyPublisher()
    }

    private func fetchUserByFirstName(_ firstName: String, context: NSManagedObjectContext) -> AnyPublisher<User?, Never> {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "firstName == %@", firstName)

        do {
            let result = try context.fetch(fetchRequest)
            return Just(result.first).eraseToAnyPublisher()
        } catch {
            print("Error fetching user: \(error)")
            return Just(nil).eraseToAnyPublisher()
        }
    }
}

