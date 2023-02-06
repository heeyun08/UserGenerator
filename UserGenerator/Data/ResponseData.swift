//
//  ResponseData.swift
//  UserGenerator
//
//  Created by netid on 2023/02/03.
//

import Foundation

struct RandomUser: Codable, Identifiable, CustomStringConvertible {
    var id = UUID()
    var name: Name
    var picture: Picture
    var profileImgUrl: URL {
        get {
            URL(string: picture.large)!
        }
    }
    var location: Location
    var email: String
    var login: Login
    var dob: Dob
    var phone: String
    var description: String {
        let tmp = phone
        var num = tmp.components(separatedBy: ["-","(",")"," "])
        let ttmp = Array(num.joined())
//        let des = "(\(num[0..<3])) \(num[3..<5])-\(num[5..<10])"
        dump(num)
        dump(ttmp)
        let des = num.joined()
        return des
    }
    private enum CodingKeys: String, CodingKey {
        case name, location, email, login, dob, phone, picture
    }
    
    //dummy data
    static func getDummy() -> Self {
        return RandomUser(name: Name.getDummy(), picture: Picture.getDummy(), location: Location.init(street: Street.getDummy()), email: "HY08@example.com", login: Login.getDummy(), dob: Dob.getDummy(), phone: "010-1234-5678")
    }
}

struct Name: Codable, CustomStringConvertible {
    var title: String
    var first: String
    var last: String
    var description: String {
        return "\(first) \(last)"
    }
    static func getDummy() -> Self {
        return Name(title: "연구원", first: "Heeyun", last: "Kwon")
    }
}

struct Picture: Codable, CustomStringConvertible {
    var large: String
    var medium: String
    var thumbnail: String
    static func getDummy() -> Self {
        return Picture(large: "https://randomuser.me/api/portraits/women/46.jpg",
                       medium: "https://randomuser.me/api/portraits/women/46.jpg",
                       thumbnail: "https://randomuser.me/api/portraits/women/46.jpg")
    }
}

struct Location: Codable {
    var street: Street
    private enum CodingKeys: String, CodingKey {
        case street
    }
}

struct Street: Codable, CustomStringConvertible {
    var number: Int
    var name: String
    var description: String {
        return "\(number) \(name)"
    }
    static func getDummy() -> Self {
        return Street(number: 63, name: "Netid")
    }
}

struct Login: Codable {
    var password: String
    private enum CodingKeys: String, CodingKey {
        case password
    }
    static func getDummy() -> Self {
        return Login(password: "mylife")
    }
}

struct Dob: Codable, CustomStringConvertible {
    var date: String
    var description: String {
        var tmp = date
        tmp.removeLast(14)
        let birth = tmp.components(separatedBy: "-")
        let des = "\(birth[1])/\(birth[2])/\(birth[0])"
        
        return des
    }
    private enum CodingKeys: String, CodingKey {
        case date
    }
    static func getDummy() -> Self {
        return Dob(date: "1999-01-19T09:25:02.837Z")
    }
}

struct Info: Codable {
    var seed: String
    var resultsCount: Int
    var page: Int
    var version: String
    private enum CodingKeys: String, CodingKey {
        case seed = "seed"
        case resultsCount = "results"
        case page = "page"
        case version = "version"
    }
}

struct RandomUserResponse: Codable, CustomStringConvertible {
    var results: [RandomUser]
    var info: Info
    //description custom
    var description: String {
        return "results.count: \(results.count) info: \(info.seed)"
    }
}
