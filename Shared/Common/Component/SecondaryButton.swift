//
//  SecondaryButton.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import SwiftUI

struct SecondaryButton: View {
	
	var systemName: String
	var action: () -> Void

	var body: some View {
		Button {
			action()
		} label: {
			Image(systemName: systemName)
				.padding()
				.foregroundColor(.gray)
				.background(
					Circle()
						.foregroundColor(.white)
				)
		}
	}
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(systemName: "envelope", action: {})
				.padding()
				.background(Color.teal)
    }
}
