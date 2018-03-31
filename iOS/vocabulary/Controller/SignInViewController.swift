//
//  SignInViewController.swift
//  vocabulary
//
//  Created by lcl on 2018/3/31.
//  Copyright © 2018年 com.vulpes. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class SignInViewController: UIViewController {
    @IBOutlet var usernameTextField : UITextField!
    @IBOutlet var passwordTextField : UITextField!
    
    @IBOutlet var signInButton : UIButton!
    @IBOutlet var signUpButton : UIButton!
    
    let viewModel = SignInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        bindData()
    }
    
    func setupView() {
        signInButton.layer.cornerRadius = 4
        signUpButton.layer.cornerRadius = 4
        
        signInButton.layer.masksToBounds = true
        signUpButton.layer.masksToBounds = true
    }
    
    func bindData() {
        signInButton.reactive.pressed = CocoaAction(viewModel.signInAction)
        viewModel.username <~ usernameTextField.reactive.textValues
        viewModel.password <~ passwordTextField.reactive.textValues


        viewModel.signInSuccessSignal.observeValues {_ in
            self.dismiss(animated: true, completion: nil)
        }
    }
}
