//
//  ApiPath.swift
//  FoodAndFitness
//
//  Created by Mylo Ho on 3/7/16.
//  Copyright © 2016 SuHoVan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftDate

private protocol URLStringConvertible {
    var URLString: String { get }
}

final class ApiPath {

    static var baseURL = "http://localhost:3000"

    static var googleMapURL = "https://maps.googleapis.com/maps/api/"

    // MARK: - Roots
    private static var auth: String { return baseURL / "auth" }
    static var users: String { return baseURL / "users" }
    static var foods: String { return baseURL / "foods" }
    static var exercises: String { return baseURL / "exercises" }
    static var userFoods: String { return baseURL / "user_foods" }
    static var userExercises: String { return baseURL / "user_exercises" }
    static var trackings: String { return baseURL / "trackings" }

    struct Auth {
        static var auth: String {
            return ApiPath.auth
        }
        static var signin: String {
            return ApiPath.auth / "sign_in"
        }
    }

    struct Food {
        var foodId: Int

        init(foodId: Int) {
            self.foodId = foodId
        }
    }

    struct UserFood {
        var id: Int

        init(id: Int) {
            self.id = id
        }

        var delete: String {
            return ApiPath.userFoods / id
        }

    }

    struct UserExercise {
        var id: Int

        init(id: Int) {
            self.id = id
        }

        var delete: String {
            return ApiPath.userExercises / id
        }
    }

    struct Tracking {
        var id: Int

        init(id: Int) {
            self.id = id
        }

        var delete: String {
            return ApiPath.trackings / id
        }
    }

    struct User {
        var userID: Int

        init(userID: Int) {
            self.userID = userID
        }

        static var upload: String { return ApiPath.baseURL / "avatars" / "upload" }
    }
}

private func / (lhs: String, rhs: String) -> String {
    return lhs.append(path: rhs)
}

private func / (lhs: String, rhs: URLStringConvertible) -> String {
    return lhs.append(path: rhs.URLString)
}

private func / (lhs: URLStringConvertible, rhs: String) -> String {
    return lhs.URLString.append(path: rhs)
}

private func / (lhs: URLStringConvertible, rhs: URLStringConvertible) -> String {
    return lhs.URLString.append(path: rhs.URLString)
}

private func / (lhs: String, rhs: Int) -> String {
    return lhs.append(path: "\(rhs)")
}

private func / (lhs: URLStringConvertible, rhs: Int) -> String {
    return lhs.URLString.append(path: "\(rhs)")
}

extension String {
    public func append(path: String) -> String {
        let set = NSCharacterSet(charactersIn: "/")
        let left = trimmedRight(characterSet: set as CharacterSet)
        let right = path.trimmed(characterSet: set as CharacterSet)
        return left + "/" + right
    }
}
