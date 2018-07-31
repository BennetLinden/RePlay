//
//  CharacterListView.swift
//  RePlay
//
//  Created by Bennet van der Linden on 31/07/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//
//

import Foundation

// Presenter -> View
protocol CharacterListView: View {
    func showCharacters(_ characters: [String])
}
