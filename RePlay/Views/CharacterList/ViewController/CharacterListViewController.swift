//
//  CharacterListViewController.swift
//  RePlay
//
//  Created by Bennet van der Linden on 31/07/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//
//

import UIKit

final class CharacterListViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!

    private let presenter: CharacterListPresenter
    private var characters: [String] = []

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(presenter: CharacterListPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: CharacterListViewController.self), bundle: .main)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(view: self)

        tableView.dataSource = self

        presenter.viewDidLoad()
    }

}

extension CharacterListViewController: CharacterListView {

    func showCharacters(_ characters: [String]) {
        self.characters = characters
        tableView.reloadData()
    }
}

extension CharacterListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = characters[indexPath.row]
        return cell
    }
}
