//
//  ContactDetailView.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import SwiftUI

struct ContactDetailView: View {

	@ObservedObject var viewModel = ContactDetailViewModel()
	var user: UserData

	var body: some View {
		VStack {
			GeometryReader { geo in
				VStack {
					ImageLoader(
						url: user.avatar.orEmpty(),
						width: geo.size.width/3.5,
						height: geo.size.width/3.5
					)
						.clipShape(Circle())
						.overlay(
							Circle()
								.stroke(Color.white, lineWidth: 1.5)
						)

					Text(user.firstName.orEmpty() + " " + user.lastName.orEmpty())
						.font(.system(size: 16, weight: .bold, design: .default))
				}
				.padding()
				.frame(width: geo.size.width)
				.background(
					LinearGradient(colors: [.teal.opacity(0.3), .white], startPoint: .bottom, endPoint: .top)
				)
			}
		}
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

struct ContactDetailView_Previews: PreviewProvider {
	static var previews: some View {
		ContactDetailView(
			user: UserData(
				id: 1,
				email: "test@mail.com",
				firstName: "test",
				lastName: "test",
				avatar: ""
			)
		)
	}
}
