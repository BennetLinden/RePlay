//
//  CharacterDetailViewController.swift
//  RePlay
//
//  Created by Bennet van der Linden on 01/08/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//
//

import UIKit

final class CharacterDetailViewController: UIViewController {

    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    private let presenter: CharacterDetailPresenter

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(presenter: CharacterDetailPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: CharacterDetailViewController.self), bundle: .main)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(view: self)

        presenter.viewDidLoad()
    }

}

extension CharacterDetailViewController: CharacterDetailView {

    func showTitle(_ title: String?) {
        self.title = title
    }

    func showLoader() {
        activityIndicator.startAnimating()
    }

    func hideLoader() {
        activityIndicator.stopAnimating()
    }
}
