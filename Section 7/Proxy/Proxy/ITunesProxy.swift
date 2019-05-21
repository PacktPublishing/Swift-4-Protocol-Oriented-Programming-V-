//
//  ITunesProxy.swift
//  Proxy
//
//  Created by Jon Hoffman on 9/5/17.
//  Copyright © 2017 Jon Hoffman. All rights reserved.
//

import Foundation

public typealias DataFromURLCompletionClosure = (Data?) -> Void

public struct ITunesProxy {
    public func sendGetRequest (searchTerm: String, handler: @escaping DataFromURLCompletionClosure) {
        
        let sessionConfiguration =
            URLSessionConfiguration.default
        
        var url = URLComponents()
        url.scheme = "https"
        url.host = "itunes.apple.com"
        url.path = "/search"
        
        url.queryItems = [
            URLQueryItem(name: "term", value: searchTerm),
        ]

        if let queryUrl = url.url {
            var request = URLRequest(url:queryUrl)
            request.httpMethod = "GET"
            let urlSession = URLSession(
                configuration:sessionConfiguration, delegate: nil, delegateQueue: nil)
            
            let sessionTask = urlSession.dataTask(with: request) {
                (data, response, error) in
                
                handler(data)
            }
            
            sessionTask.resume()
        }
    }
}
