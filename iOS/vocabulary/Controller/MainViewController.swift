//
//  MainViewController.swift
//  vocabulary
//
//  Created by lcl on 2018/3/31.
//  Copyright © 2018年 com.vulpes. All rights reserved.
//

import UIKit
import ReactiveSwift

class MainViewController: UIViewController {
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bindData()
    }
    
    func bindData() {
        viewModel.mainState <~ self.reactive.trigger(for: #selector(viewDidAppear(_:)))
        
        viewModel.noAccountSignal.observeValues {
            self.performSegue(withIdentifier: "signIn", sender: self)
        }
    }
}
