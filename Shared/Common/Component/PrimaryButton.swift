//
//  PrimaryButton.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import SwiftUI

struct PrimaryButton: View {

	var systemName: String
	var action: () -> Void

	var body: some View {
		Button {
			action()
		} label: {
			Image(systemName: systemName)
				.padding()
				.foregroundColor(.white)
				.background(
					Circle()
						.foregroundColor(.teal)
				)
		}
	}
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
			PrimaryButton(systemName: "envelope.fill", action: {})
    }
}
