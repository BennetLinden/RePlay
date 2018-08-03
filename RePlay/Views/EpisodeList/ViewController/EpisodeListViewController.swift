//
//  EpisodeListViewController.swift
//  RePlay
//
//  Created by Bennet van der Linden on 02/08/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//
//

import UIKit

final class EpisodeListViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!

    private let presenter: EpisodeListPresenter

    private var episodes: [String] = []

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(presenter: EpisodeListPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: EpisodeListViewController.self), bundle: .main)
        title = "Episodes"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(view: self)

        tableView.dataSource = self
        tableView.delegate = self

        presenter.viewDidLoad()
    }
}

extension EpisodeListViewController: EpisodeListView {

    func showEpisodes(_ episodes: [String]) {
        self.episodes = episodes
        tableView.reloadData()
    }
}

extension EpisodeListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = episodes[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 5 {
            presenter.didScrollToEnd()
        }
    }
}
