//
//  ContactCard.swift
//  Contact
//
//  Created by Gus Adi on 27/04/22.
//

import SwiftUI

struct ContactCard: View {

	var user: UserData

	var body: some View {
		HStack(spacing: 20) {
			ImageLoader(
				url: user.avatar.orEmpty(),
				width: 50
			)

			Text(user.firstName.orEmpty() + " " + user.lastName.orEmpty())
				.font(.system(size: 14, weight: .bold, design: .default))

			Spacer()
		}
		.padding(.vertical, 10)
	}
}

struct ContactCard_Previews: PreviewProvider {
	static var previews: some View {
		ContactCard(
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
