//
//  ResponseMapper.swift
//  Charades
//
//  Created by Bennet van der Linden on 26/05/2018.
//  Copyright © 2018 Bennet. All rights reserved.
//

import Foundation
import PromiseKit

class ResponseMapper<Response: Decodable> {

    static func map(_ data: Data) -> Promise<Response> {
        return Promise { seal in
            do {
                try seal.fulfill(JSONDecoder().decode(Response.self, from: data))
            } catch {
                seal.reject(error)
            }
        }
    }
}
