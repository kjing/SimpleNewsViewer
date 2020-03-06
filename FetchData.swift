//
//  FetchData.swift
//  SimpleNewsViewer
//
//  Created by Kai Jing on 3/5/20.
//  Copyright © 2020 Kai Jing. All rights reserved.
//

import Foundation

// Define a value type Results to
// have google news's articles
struct Results: Decodable {
    let articles: [Post]
}

// Define a value type Post to
// include id which is title, url...
// I have a screenshot of google news
// Json view for reference.
struct Post: Decodable, Identifiable {
	// id for Identifiable
	var id: String {
        return title
    }
	// sometime author,description and urlToImage
	// could be null, so they are optional.
	let author: String?
    let title: String
    let description: String?
    let urlToImage: URL?
    let url: String
}
