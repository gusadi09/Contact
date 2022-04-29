//
//  ContactDetailView.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import SwiftUI

struct ContactDetailView: View {
	
	@ObservedObject var viewModel = ContactDetailViewModel()
	var id: UInt
	
	var body: some View {
		GeometryReader { geo in
			ZStack(alignment: .top) {
				VStack {
					HeaderView(viewModel: viewModel, geo: geo)

					VStack {
						HStack(spacing: 20) {
							Text(LocalizableText.detailScreenContactIDText)
								.font(.system(size: 14, weight: .regular, design: .default))
								.foregroundColor(.gray)

							Text("\((viewModel.user?.data?.id).orZero())")
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
			.task {
				await viewModel.getUsers(by: id)
			}
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
			id: 1
		)
	}
}
