//
//  EpisodeListViewControllerFactory.swift
//  RePlay
//
//  Created by Bennet van der Linden on 02/08/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import UIKit

protocol EpisodeListViewControllerFactory {
    func makeEpisodeListViewController() -> UIViewController
}
