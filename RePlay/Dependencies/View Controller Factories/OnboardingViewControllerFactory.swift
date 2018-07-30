//
//  OnboardingViewControllerFactory.swift
//  RePlay
//
//  Created by Bennet van der Linden on 27/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import UIKit

protocol OnboardingViewControllerFactory {
    func makeOnboardingViewController() -> UIViewController
}
