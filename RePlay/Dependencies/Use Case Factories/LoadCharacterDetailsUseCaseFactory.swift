//
//  LoadCharacterDetailsUseCaseFactory.swift
//  RePlay
//
//  Created by Bennet van der Linden on 01/08/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation

protocol LoadCharacterDetailsUseCaseFactory {
    func makeCharacterDetailsUseCase(characterId: Int) -> UseCase
}
