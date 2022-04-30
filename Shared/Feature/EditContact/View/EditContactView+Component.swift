//
//  EditContactView+Component.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import SwiftUI

extension EditContactView {

	struct HeaderView: View {

		var avatar: String
		var geo: GeometryProxy

		var body: some View {
			VStack {
				ImageLoader(
					url: avatar,
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

