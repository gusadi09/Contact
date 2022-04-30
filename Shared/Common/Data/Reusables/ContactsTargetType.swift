//
//  ContactTargetType.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 28/04/22.
//

import Foundation
import Moya

protocol ContactsTargetType: TargetType {
	var parameters: [String: Any] {
		get
	}
}

extension ContactsTargetType {

	var baseURL: URL {
		return URL(string: "https://reqres.in/api") ?? (NSURL() as URL)
	}

	var parameterEncoding: Moya.ParameterEncoding {
		JSONEncoding.default
	}

	var task: Task {
		return .requestParameters(parameters: parameters, encoding: parameterEncoding)
	}

	var headers: [String: String]? {
		return [:]
	}
}
