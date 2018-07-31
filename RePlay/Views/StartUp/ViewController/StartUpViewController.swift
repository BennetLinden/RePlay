//
//  StartUpViewController.swift
//  RePlay
//
//  Created by Bennet van der Linden on 27/07/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//
//

import UIKit

final class StartUpViewController: UIViewController {

    @IBOutlet private var activityIndicatorView: UIActivityIndicatorView!

    private let presenter: StartUpPresenter
    private let onboardingViewControllerFactory: OnboardingViewControllerFactory

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(presenter: StartUpPresenter,
         onboardingViewControllerFactory: OnboardingViewControllerFactory) {
        self.presenter = presenter
        self.onboardingViewControllerFactory = onboardingViewControllerFactory
        super.init(nibName: String(describing: StartUpViewController.self), bundle: .main)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(view: self)
        presenter.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
}

extension StartUpViewController: StartUpView {

    func showOnboarding() {
        let onboardingViewController = onboardingViewControllerFactory.makeOnboardingViewController()
        present(onboardingViewController, animated: true)
    }

    func showLoader() {
        activityIndicatorView.startAnimating()
    }

    func hideLoader() {
        activityIndicatorView.stopAnimating()
    }
}
