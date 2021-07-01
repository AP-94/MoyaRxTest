//
//  LoginViewController.swift
//  RxSwiftAndMoya
//
//  Created by Alessandro Pace on 1/7/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - VARS -
    
    private var loginPresenter: LoginPresenter?
    
    // MARK: - OVERRIDE METHOD -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginPresenter = LoginPresenter(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - @IBACTIONS -

    @IBAction func loginButtonTapped(_ sender: Any) {
        loginPresenter?.doLogin()
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        loginPresenter?.goToRegister()
    }
    
    @IBAction func forgetPassButtonTapped(_ sender: Any) {
        loginPresenter?.goToForgetPass()
    }
}

extension LoginViewController: LoginPresenterDelegate {
    func goToHomeStoryboard(viewController: UIViewController) {
        self.present(viewController, animated: true, completion: nil)
    }
}
