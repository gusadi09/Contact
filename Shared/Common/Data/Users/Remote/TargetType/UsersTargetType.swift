//
//  UsersTargetType.swift
//  Contact (iOS)
//
//  Created by Gus Adi on 28/04/22.
//

import Foundation
import Moya

enum UsersTargetType {
	case getListUsers(UInt)
	case getSingleUser(UInt)
	case createUser(UserBody)
	case updateUser(UInt, UserBody)
}

extension UsersTargetType: ContactsTargetType {
	var parameters: [String : Any] {
		switch self {
		case .getListUsers(let page):
			return [
				"page": page,
				"per_page": 10
			]
		case .getSingleUser:
			return [:]
		case .createUser(let userBody):
			return userBody.toJSON()
		case .updateUser(_, let userBody):
			return userBody.toJSON()
		}
	}

	var parameterEncoding: Moya.ParameterEncoding {
		switch self {
		case .getListUsers:
			return URLEncoding.default
		case .getSingleUser:
			return URLEncoding.default
		case .createUser:
			return JSONEncoding.default
		case .updateUser:
			return JSONEncoding.default
		}
	}

	var task: Task {
		return .requestParameters(parameters: parameters, encoding: parameterEncoding)
	}

	var path: String {
		switch self {
		case .getListUsers:
			return "/users"
		case .getSingleUser(let userID):
			return "/users/\(userID)"
		case .createUser:
			return "/users"
		case .updateUser(let userID, _):
			return "/users/\(userID)"
		}
	}

	var sampleData: Data {
		switch self {
		case .getListUsers(let page):
			let response = UserListResponse(
				page: page,
				perPage: 10, total: 10,
				totalPages: 2,
				data: [
					UserData(
						id: 1,
						email: "unittest@mail.com",
						firstName: "Unit",
						lastName: "Test",
						avatar: "https://unittest.com/unitest.jpg"
					)
				]
			)

			return response.toJSONData()
		case .getSingleUser(let userID):
			let response = UserData(
				id: userID,
				email: "unittest@mail.com",
				firstName: "Unit",
				lastName: "Test",
				avatar: "https://unittest.com/unitest.jpg"
			)

			return response.toJSONData()
		case .createUser(let userBody):
			let response = CreateResponse(firstName: userBody.firstName, lastName: userBody.lastName, id: "1")
			return response.toJSONData()
		case .updateUser( _, let userBody):
			let response = CreateResponse(firstName: userBody.firstName, lastName: userBody.lastName, id: nil)
			return response.toJSONData()
		}
	}

	var method: Moya.Method {
		switch self {
		case .getListUsers:
			return .get
		case .getSingleUser:
			return .get
		case .createUser:
			return .post
		case .updateUser:
			return .put
		}
	}
}
