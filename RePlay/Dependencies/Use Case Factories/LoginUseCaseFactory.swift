//
//  LoginUseCaseFactory.swift
//  RePlay
//
//  Created by Bennet van der Linden on 30/07/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation

protocol LoginUseCaseFactory {
    func makeLoginUseCase(email: String, password: String) -> UseCase
}
