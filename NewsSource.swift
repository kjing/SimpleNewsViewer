//
//  NewsSource.swift
//  SimpleNewsViewer
//
//  Created by Kai Jing on 3/5/20.
//  Copyright © 2020 Kai Jing. All rights reserved.
//

import Foundation

class NewsSource: ObservableObject {

    @Published var posts = [Post]()

    func fetchData() {

		// Here is my apiToken generated from https://newsapi.org/s/google-news-api
		let apiToken = "81f18f7c2a7e4274b443f9ecaf8f7082"
		let sourceUrl = "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=\(apiToken)"

		if let url = URL(string: sourceUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
				// no error, so we fetch news data successfully
                if error == nil {
					// JSON decoder
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
								// return news articles
								self.posts = results.articles
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
