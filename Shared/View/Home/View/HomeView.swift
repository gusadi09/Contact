//
//  ContentView.swift
//  Shared
//
//  Created by Gus Adi on 26/04/22.
//

import SwiftUI
import CoreData

struct HomeView: View {

	@ObservedObject var viewModel = HomeViewModel()

	var body: some View {
		List {
			Section {
				ForEach(viewModel.userLists, id: \.id) { item in
					ContactCard(user: item)
						.task {
							if item.id == viewModel.userLists.last?.id {
								viewModel.page += 1
								await viewModel.getUsersList()
							}
						}
				}
			}
		}
		.listStyle(.plain)
		.refreshable {
			viewModel.userLists = []
			viewModel.page = 1
			viewModel.onLoadContact()
		}
		.onAppear(perform: {
			viewModel.onLoadContact()
		})
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
