import SwiftUI

protocol NavigationManagerProtocol: AnyObject {
  var currentView: AnyView? { get set }
  var previousView: AnyView? { get set }
  var customTabBar: AnyView? { get set }
  func navigateTo(view: AnyView)
  func navigateBack()
}
