//
//  DemoURLs.swift
//  Cassini
//
//  Created by bogdanov on 31.03.21.
//

import Foundation

struct DemoURLs {
    static let cassini = Bundle.main.url(forResource: "cassini", withExtension: "jpg")

    //    static let stanford = URL(string: "https://upload.wikimedia.org/wikipedia/commons/5/55/Stanford_Oval_September_2013_panorama.jpg")

    static var NASA: [String: URL] = {
        let NASAURLStrings = [
            "Cassini": "https://fastly.syfy.com/sites/syfy/files/cassini_finaldives_artwork.jpg",
            "Earth": "https://upload.wikimedia.org/wikipedia/commons/7/7b/Earth_Western_Hemisphere.jpg",
            "Saturn": "https://upload.wikimedia.org/wikipedia/commons/c/c7/Saturn_during_Equinox.jpg"
        ]
        var urls = [String: URL]()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
