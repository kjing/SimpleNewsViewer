//
//  ContentView.swift
//  SimpleNewsViewer
//
//  Created by Kai Jing on 3/5/20.
//  Copyright © 2020 Kai Jing. All rights reserved.
//

import SwiftUI

struct ContentView: View {

	// In ContentView to store an NewsSource instance
	// to update view when they change.
	@ObservedObject var newsSource = NewsSource()

	var body: some View {
		   // to use NavigationView
		   NavigationView {
			   List(newsSource.posts) { post in
				   // to pass google new artichle's url to NewsView
				   // and use webview to view it.
				   NavigationLink(destination: NewsView(url: post.url)) {
					   HStack {
						   Text(String("articles :\n "))
						   Text(post.title)
					   }
				   }
			   }
			   .navigationBarTitle("A News Viewer")
		   }
		   .onAppear {
			   self.newsSource.fetchData()
		   }
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
