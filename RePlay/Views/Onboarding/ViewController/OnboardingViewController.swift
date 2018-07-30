//
//  OnboardingViewController.swift
//  RePlay
//
//  Created by Bennet van der Linden on 27/07/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//
//

import UIKit

final class OnboardingViewController: UIViewController {

    @IBOutlet private var label: UILabel!

    private let presenter: OnboardingPresenter

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(presenter: OnboardingPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: OnboardingViewController.self), bundle: .main)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(view: self)

        presenter.viewDidLoad()
    }

    @IBAction private func completeButtonPressed(_ sender: UIButton) {
        presenter.completeButtonPressed()
    }

    deinit {
        print("deleted OnboardingViewController")
    }

}

extension OnboardingViewController: OnboardingView {

    func showPages(_ pages: [String]) {
        label.text = "Pages: \(pages.count)"
    }
}
