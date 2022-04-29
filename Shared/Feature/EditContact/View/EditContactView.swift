//
//  EditContactView.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 29/04/22.
//

import SwiftUI

struct EditContactView: View {
	
	@ObservedObject var viewModel = EditContactViewModel()

	var body: some View {
		Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
	}
}

struct EditContactView_Previews: PreviewProvider {
    static var previews: some View {
        EditContactView()
    }
}
