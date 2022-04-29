//
//  CreateContactView.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import SwiftUI

struct CreateContactView: View {

	@ObservedObject var viewModel = CreateContactViewModel()

	var body: some View {
		GeometryReader { proxy in
			VStack {
				HeaderView(geo: proxy)

				VStack {
					HStack(spacing: 20) {
						Text("First Name")
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
						Text("Last Name")
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
			}
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {

					} label: {
						Text("Done")
							.foregroundColor(.teal)
					}
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
