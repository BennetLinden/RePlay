//
//  CharacterListViewControllerFactory.swift
//  RePlay
//
//  Created by Bennet van der Linden on 31/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import UIKit

protocol CharacterListViewControllerFactory {
    func makeCharacterListViewController() -> UIViewController
}
