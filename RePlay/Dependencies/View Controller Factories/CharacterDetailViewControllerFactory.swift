//
//  CharacterDetailViewControllerFactory.swift
//  RePlay
//
//  Created by Bennet van der Linden on 01/08/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import UIKit

protocol CharacterDetailViewControllerFactory {
    func makeCharacterDetailViewController(for characterId: Int) -> UIViewController
}
