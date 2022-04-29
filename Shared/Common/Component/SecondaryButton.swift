//
//  SecondaryButton.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import SwiftUI

struct SecondaryButton: View {
	
	var systemName: String
	var buttonTitle: String
	var action: () -> Void

	var body: some View {
		Button {
			action()
		} label: {
			VStack(spacing: 2) {
				Image(systemName: systemName)
					.scaledToFit()
					.frame(width: 10)
					.padding()
					.foregroundColor(.gray)
					.background(
						Circle()
							.foregroundColor(.white)
				)

				Text(buttonTitle)
					.font(.system(size: 10, weight: .light, design: .default))
					.foregroundColor(.black)
			}
		}
	}
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
			SecondaryButton(systemName: "envelope", buttonTitle: "email", action: {})
				.padding()
				.background(Color.teal)
    }
}
