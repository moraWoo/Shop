//
//  UserRepository.swift
//  Shop
//
//  Created by Ильдар on 20.03.2023.
//

import Foundation
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

    func checkUser(firstName: String, lastName: String? = nil, email: String? = nil, password: String) -> AnyPublisher<User?, Never> {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()

        var predicates: [NSPredicate] = [NSPredicate(format: "firstName == %@", firstName)]

        guard !password.isEmpty else {
            return Just(nil).eraseToAnyPublisher()
        }
        predicates.append(NSPredicate(format: "password == %@", password))

        if let lastName = lastName {
            predicates.append(NSPredicate(format: "lastName == %@", lastName))
        }

        if let email = email {
            predicates.append(NSPredicate(format: "email == %@", email))
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
}

