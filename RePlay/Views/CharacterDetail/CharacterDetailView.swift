//
//  CharacterDetailView.swift
//  RePlay
//
//  Created by Bennet van der Linden on 01/08/2018.
//  Copyright (c) 2018 Bennet. All rights reserved.
//
//

import Foundation

// Presenter -> View
protocol CharacterDetailView: LoaderViewable {
    func showTitle(_ title: String?)
    func showImage(from url: URL?)
}
