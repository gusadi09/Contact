//
//  ContactCard.swift
//  Contact
//
//  Created by Gus Adi on 27/04/22.
//

import SwiftUI

struct ContactCard: View {

	var imageUrl: String
	var contactName: String

	var body: some View {
		HStack(spacing: 20) {
			ImageLoader(
				url: imageUrl,
				width: 50
			)

			Text(contactName)
				.font(.system(size: 14, weight: .bold, design: .default))

			Spacer()
		}
		.padding(.vertical, 10)
	}
}

struct ContactCard_Previews: PreviewProvider {
	static var previews: some View {
		ContactCard(imageUrl: "", contactName: "")
	}
}
