//
//  CreateContactView+Component.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import SwiftUI

extension CreateContactView {

	struct HeaderView: View {

		var geo: GeometryProxy
		
		var body: some View {
			VStack {
					ImageLoader(
						url: "https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg",
						width: geo.size.width/3.5,
						height: geo.size.width/3.5
					)
					.clipShape(Circle())
					.overlay(
						Circle()
							.stroke(Color.white, lineWidth: 1.5)
					)
			}
			.padding()
			.padding(.vertical)
			.frame(width: geo.size.width)
			.background(
				LinearGradient(colors: [.teal.opacity(0.3), .white], startPoint: .bottom, endPoint: .top)
			)
		}
	}
}
