//
//  GifNetwork.swift
//  GiphySearchIOS
//
//  Created by Mark Kim on 6/5/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class GifNetwork {
    let apiKey = "Your Api Here"
    
    func fetchGifs(searchTerm: String, completion: @escaping (_ response: GifArray?) -> Void) {
        let url = urlBuilder(searchTerm: searchTerm)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error {
                print("Error fetching from Giphy: ", err.localizedDescription)
            }
            do {
                DispatchQueue.main.async {
                    let object = try! JSONDecoder().decode(GifArray.self, from: data!)
                    completion(object)
                }
            }
            print("Giphy Data: ", data as Any)
        }.resume()
    }
    
    func urlBuilder(searchTerm: String) -> URL {
        let apikey = apiKey
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.giphy.com"
        components.path = "/v1/gifs/search"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apikey),
            URLQueryItem(name: "q", value: searchTerm),
            URLQueryItem(name: "limit", value: "5")
        ]
        return components.url!
    }
}
