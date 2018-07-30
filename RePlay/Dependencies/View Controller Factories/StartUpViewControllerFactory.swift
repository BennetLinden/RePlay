//
//  RootViewControllerFactory.swift
//  RePlay
//
//  Created by Bennet van der Linden on 26/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import UIKit

protocol StartUpViewControllerFactory {
    func makeStartUpViewController() -> UIViewController
}
