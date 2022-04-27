//
//  ContentView.swift
//  Shared
//
//  Created by Gus Adi on 26/04/22.
//

import SwiftUI
import CoreData

struct HomeView: View {
	
	var body: some View {
		List {
			
		}
		.navigationTitle(LocalizableText.homeScreenTitle)
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				Button {
					
				} label: {
					Text(LocalizableText.homeScreenGroupText)
						.foregroundColor(.teal)
				}
			}
			
			ToolbarItem(placement: .navigationBarTrailing) {
				Button {
					
				} label: {
					Image(systemName: "plus")
						.foregroundColor(.teal)
				}
			}
			
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
			HomeView()
    }
}
