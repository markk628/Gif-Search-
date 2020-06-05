//
//  Gif.swift
//  GiphySearchIOS
//
//  Created by Mark Kim on 6/5/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import Foundation

struct GifArray: Decodable {
    var gifs: [Gif]
    enum CodingKeys: String, CodingKey {
        case gifs = "data"
    }
}

struct Gif: Decodable {
    var gifSources: GifImages
    enum CodingKeys: String, CodingKey {
        case gifSources = "images"
    }
    
    func getGifURL() -> String {
        return gifSources.original.url
    }
}

struct GifImages: Decodable {
    var original: original
    enum CodingKeys: String, CodingKey {
        case original = "original"
    }
}

struct original: Decodable {
    var url: String
}
