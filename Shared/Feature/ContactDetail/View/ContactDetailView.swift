//
//  ContactDetailView.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import SwiftUI

struct ContactDetailView: View {
	
	@ObservedObject var viewModel = ContactDetailViewModel()
	@Binding var user: Contact
	
	var body: some View {
		GeometryReader { geo in
			ZStack(alignment: .top) {
				VStack {
					HeaderView(item: $viewModel.contact, geo: geo)

					VStack {
						HStack(spacing: 20) {
							Text(LocalizableText.detailScreenContactIDText)
								.font(.system(size: 14, weight: .regular, design: .default))
								.foregroundColor(.gray)

							Text("\((viewModel.contact?.id) ?? 0)")
								.font(.system(size: 14, weight: .regular, design: .default))
								.foregroundColor(.gray)

							Spacer()
						}
						.padding(.horizontal)
						.padding(.vertical, 10)

						Divider()
					}
					.padding(.leading, 20)
				}

				if viewModel.isLoading {
					ZStack {
						Color.black.opacity(0.4)
							.edgesIgnoringSafeArea(.all)

						ProgressView()
							.progressViewStyle(.circular)
							.tint(.white)
					}
				}
			}
			.onAppear(perform: {
				Task {
					self.viewModel.contact = user
					await viewModel.loadLocalUser(user: user)
				}
			})
			.alert(isPresented: $viewModel.isError, content: {
				Alert(
					title: Text(LocalizableText.generalAttentionText),
					message: Text(viewModel.error),
					dismissButton: .cancel()
				)
			})
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					NavigationLink {
						EditContactView(user: user)
					} label: {
						Text(LocalizableText.detailScreenEditText)
							.foregroundColor(.teal)
					}
				}
			}
		}
	}
}

struct ContactDetailView_Previews: PreviewProvider {
	static var previews: some View {
		ContactDetailView(
			user: .constant(Contact())
		)
	}
}
