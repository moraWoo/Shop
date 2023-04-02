import Foundation
import Combine
import UIKit

protocol UserRepositoryProtocol: AnyObject {
    var firstName: String? { get set }
    var currentUser: User? { get }
    func createUser(firstName: String, lastName: String, email: String, password: String) -> AnyPublisher<Bool, Never>
    func checkUser(firstName: String, lastName: String?, email: String?, password: String?) -> AnyPublisher<User?, Never>
    func setIsLogged(user: User, isLogged: Bool)
    func fetchLoggedInUser() -> AnyPublisher<User?, Never>
    func saveContext()
    func updateAvatar(user: User, avatar: UIImage)
    func fetchAvatar() -> AnyPublisher<UIImage?, Never>
}
