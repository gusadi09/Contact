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

	init() {
		UITableView.appearance().sectionFooterHeight = 0
		UITableView.appearance().sectionHeaderHeight = 0
	}

	var body: some View {
		List {
			ForEach(viewModel.sectionedDict.keys.sorted(), id: \.self) { key in

				if let contacts = viewModel.sectionedDict[key] {
					ForEach(contacts, id: \.id) { item in
						Section {
							NavigationLink {
								ContactDetailView(user: item)
							} label: {
								ContactCard(user: item)
							}
							.task {
								if item.id == viewModel.userLists.last?.id {
									viewModel.page += 1
									await viewModel.getUsersList()
								}
							}
						} header: {
							Text("\(key)")
						}
					}
				}
			}
		}
		.listStyle(.plain)
		.refreshable {
			Task {
				viewModel.userLists = []
				viewModel.page = 1
				await viewModel.getUsersList()
			}
		}
		.onAppear(perform: {
			viewModel.onLoadContact()
		})
		.alert(isPresented: $viewModel.isError, content: {
			Alert(
				title: Text(LocalizableText.generalAttentionText),
				message: Text(viewModel.error),
				dismissButton: .cancel()
			)
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
