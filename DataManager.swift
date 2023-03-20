//
//  DataManager.swift
//  Shop
//
//  Created by Ильдар on 19.03.2023.
//

import Foundation
import CoreData
import Combine

class DataManager {
    private let managedObjectContext: NSManagedObjectContext

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    func createUser(firstName: String, lastName: String, email: String, password: String, avatar: Data?) -> AnyPublisher<Bool, Error> {
        return Future { promise in
            let newUser = User(context: self.managedObjectContext)
            newUser.firstName = firstName
            newUser.lastName = lastName
            newUser.email = email
            newUser.password = password
            newUser.avatar = avatar

            do {
                try self.managedObjectContext.save()
                promise(.success(true))
            } catch {
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }

    func userExists(firstName: String, password: String) -> AnyPublisher<Bool, Error> {
        return Future { promise in
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "firstName == %@ AND password == %@", firstName, password)

            do {
                let result = try self.managedObjectContext.fetch(fetchRequest)
                promise(.success(!result.isEmpty))
            } catch {
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
}
