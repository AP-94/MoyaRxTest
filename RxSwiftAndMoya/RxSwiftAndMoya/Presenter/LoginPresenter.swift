//
//  LoginPresenter.swift
//  RxSwiftAndMoya
//
//  Created by Alessandro Pace on 1/7/21.
//

import Foundation
import UIKit

protocol LoginPresenterDelegate {
    func goToHomeStoryboard(viewController: UIViewController)
}

typealias LoginDelegate = LoginPresenterDelegate & UIViewController

class LoginPresenter: NSObject {
    
    private var delegate: LoginDelegate?
    
    // MARK: - INIT -
    
    init(delegate: LoginDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - METHODS -
    
    func doLogin() {
        let viewController = getViewController(viewControllerIdentifier: "HomeViewController", storyBoardName: "Main") as! HomeViewController
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.modalPresentationStyle = .fullScreen
        delegate?.goToHomeStoryboard(viewController: navigationController)
    }
    
    func goToRegister() {
        let viewController = getViewController(viewControllerIdentifier: "RegisterViewController", storyBoardName: "Login") as! RegisterViewController
        delegate?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToForgetPass() {
        let viewController = getViewController(viewControllerIdentifier: "ForgetPasswordViewController", storyBoardName: "Login") as! ForgetPasswordViewController
        delegate?.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
