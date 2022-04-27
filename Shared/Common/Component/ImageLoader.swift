//
//  ImageLoader.swift
//  Contact
//
//  Created by Gus Adi on 27/04/22.
//

import SwiftUI

struct ImageLoader: View {

	var url: String
	var width: CGFloat?
	var height: CGFloat?

    var body: some View {
			AsyncImage(
				url: URL(string: url),
				content: { phase in
					switch phase {
					case .empty:
						Image(systemName: "photo")
							.resizable()
							.scaledToFit()
							.frame(width: 30)
					case .failure:
						Image(systemName: "photo")
							.resizable()
							.scaledToFit()
							.frame(width: 30)
					case .success(let image):
						image
							.resizable()
							.scaledToFit()
							.frame(width: width, height: height)
							.clipShape(Circle())
					@unknown default:
						Image(systemName: "photo")
							.resizable()
							.scaledToFit()
							.frame(width: 30)
					}
				}
			)
    }
}

struct ImageLoader_Previews: PreviewProvider {
    static var previews: some View {
			ImageLoader(url: "https://icon-library.com/images/default-user-icon/default-user-icon-13.jpg")
    }
}
