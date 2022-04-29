//
//  ContactDetailView+Component.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import SwiftUI

extension ContactDetailView {
	struct HeaderView: View {
		
		var item: Contact
		var geo: GeometryProxy
		
		var body: some View {
			VStack(spacing: 20) {
				VStack {
					ImageLoader(
						url: item.avatar.orEmpty(),
						width: geo.size.width/3.5,
						height: geo.size.width/3.5
					)
					.clipShape(Circle())
					.overlay(
						Circle()
							.stroke(Color.white, lineWidth: 1.5)
					)
					
					Text(item.firstName.orEmpty() + " " + item.lastName.orEmpty())
						.font(.system(size: 16, weight: .bold, design: .default))
				}
				
				HStack(spacing: 20) {
					PrimaryButton(
						systemName: "bubble.left.fill",
						buttonTitle: LocalizableText.detailScreenMessageText,
						action: {}
					)
					PrimaryButton(
						systemName: "phone.fill",
						buttonTitle: LocalizableText.detailScreenCallText,
						action: {}
					)
					PrimaryButton(
						systemName: "envelope.fill",
						buttonTitle: LocalizableText.detailScreenEmailText,
						action: {}
					)
					SecondaryButton(
						systemName: "star",
						buttonTitle: LocalizableText.detailScreenFavouriteText,
						action: {}
					)
				}
			}
			.padding()
			.frame(width: geo.size.width)
			.background(
				LinearGradient(colors: [.teal.opacity(0.3), .white], startPoint: .bottom, endPoint: .top)
			)
		}
	}
}
