//
//  PrimaryButton.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import SwiftUI

struct PrimaryButton: View {

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
					.foregroundColor(.white)
					.background(
						Circle()
							.foregroundColor(.teal)
				)

				Text(buttonTitle)
					.font(.system(size: 10, weight: .light, design: .default))
					.foregroundColor(.black)
			}
		}
	}
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
			PrimaryButton(systemName: "envelope.fill", buttonTitle: "Email", action: {})
    }
}
