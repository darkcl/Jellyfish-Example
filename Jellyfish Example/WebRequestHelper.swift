//
//  WebRequestHelper.swift
//  Jellyfish
//
//  Created by Yeung, Hung(AWF) on 13/3/2018.
//  Copyright © 2018 Jellyfish. All rights reserved.
//

import Foundation
import Jellyfish

class WebRequestHelper {
    static func makeRequest(request: URLRequest, handler:@escaping ((Data?, URLResponse?, Error?) -> Void)) {
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) -> Void in
            handler(data, response, error)
        }
        task.resume()
    }
}
