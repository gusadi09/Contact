//
//  LocalizableText.swift
//  Contact
//
//  Created by Gus Adi on 27/04/22.
//

import Foundation

enum LocalizableText {
	static let generalAttentionText = NSLocalizedString(
		"general_attention",
		comment: "attention string for general usage"
	)
	
	static let homeScreenTitle = NSLocalizedString(
		"home_screen_title",
		comment: "contact title for home screen"
	)
	static let homeScreenGroupText = NSLocalizedString(
		"home_screen_groups_text",
		comment: "groups text for leading toolbar item in home"
	)

	static let detailScreenEditText = NSLocalizedString(
		"detail_screen_edit_text",
		comment: "edit text for toolbar button on detail screen"
	)
}
