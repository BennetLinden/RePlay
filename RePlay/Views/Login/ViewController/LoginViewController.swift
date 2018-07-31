//
//  LoginViewController.swift
//  RePlay
//
//  Created by Bennet van der Linden on 30/07/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//
//

import UIKit

final class LoginViewController: UIViewController {

    private let presenter: LoginPresenter

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(presenter: LoginPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: LoginViewController.self), bundle: .main)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(view: self)

        presenter.viewDidLoad()
    }

}

extension LoginViewController: LoginView {

}
