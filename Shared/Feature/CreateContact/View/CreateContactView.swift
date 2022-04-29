//
//  CreateContactView.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import SwiftUI

struct CreateContactView: View {

	@ObservedObject var viewModel = CreateContactViewModel()

	@Environment(\.presentationMode) var presentationMode

	var body: some View {
		GeometryReader { proxy in
			ZStack(alignment: .top) {
				VStack {
					HeaderView(geo: proxy)
						.alert(isPresented: $viewModel.isError, content: {
							Alert(
								title: Text(LocalizableText.generalAttentionText),
								message: Text(viewModel.error),
								dismissButton: .cancel()
							)
						})

					VStack {
						HStack(spacing: 20) {
							Text(LocalizableText.createScreenFirstNameText)
								.font(.system(size: 14, weight: .regular, design: .default))
								.foregroundColor(.gray)

							TextField("", text: $viewModel.body.firstName)
								.font(.system(size: 14, weight: .regular, design: .default))

							Spacer()
						}
						.padding(.horizontal)
						.padding(.vertical, 10)

						Divider()

						HStack(spacing: 20) {
							Text(LocalizableText.createScreenLastNameText)
								.font(.system(size: 14, weight: .regular, design: .default))
								.foregroundColor(.gray)

							TextField("", text: $viewModel.body.lastName)
								.font(.system(size: 14, weight: .regular, design: .default))

							Spacer()
						}
						.padding(.horizontal)
						.padding(.vertical, 10)

						Divider()
					}
					.padding(.leading, 20)
					.onChange(of: viewModel.success) { _ in
						presentationMode.wrappedValue.dismiss()
					}
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
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						viewModel.onSaveContact()
					} label: {
						Text(LocalizableText.generalDoneText)
							.foregroundColor(viewModel.isDisable() ? .gray : .teal)
					}
					.disabled(viewModel.isDisable())
				}
			}
		}
	}
}

struct CreateContactView_Previews: PreviewProvider {
	static var previews: some View {
		CreateContactView()
	}
}
