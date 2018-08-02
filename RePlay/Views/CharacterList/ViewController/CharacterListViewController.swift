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

    typealias ViewControllerFactory = CharacterDetailViewControllerFactory

    @IBOutlet private var tableView: UITableView!

    private let presenter: CharacterListPresenter
    private let viewControllerFactory: ViewControllerFactory

    private var characters: [String] = []

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(presenter: CharacterListPresenter,
         viewControllerFactory: ViewControllerFactory) {
        self.presenter = presenter
        self.viewControllerFactory = viewControllerFactory
        super.init(nibName: String(describing: CharacterListViewController.self), bundle: .main)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(view: self)

        title = "Characters"

        tableView.dataSource = self
        tableView.delegate = self

        presenter.viewDidLoad()
    }
}

extension CharacterListViewController: CharacterListView {

    func showCharacters(_ characters: [String]) {
        self.characters = characters
        tableView.reloadData()
    }

    func showCharacterDetails(for characterId: Int) {
        let characterDetailViewController = viewControllerFactory.makeCharacterDetailViewController(for: characterId)
        show(characterDetailViewController, sender: self)
    }
}

extension CharacterListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = characters[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 5 {
            presenter.didScrollToEnd()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(with: indexPath.row)
    }
}
