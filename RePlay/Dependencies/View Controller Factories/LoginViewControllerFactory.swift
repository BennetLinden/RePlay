//
//  LoginViewControllerFactory.swift
//  RePlay
//
//  Created by Bennet van der Linden on 30/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import UIKit

protocol LoginViewControllerFactory {
    func makeLoginViewController() -> UIViewController
}
