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
    //전화번호 Data 가공
    var description: String {
        let num = Array(phone.components(separatedBy: ["-","(",")"," "]).joined())
        
        let first = String(num[0..<3])
        let mid = String(num[3..<6])
        let last = num.count >= 10 ? String(num[5..<9]) : String(num[5..<num.count])

        return "(\(first)) \(mid)-\(last)"
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
    var first: String
    var last: String
    var description: String {
        return "\(first) \(last)"
    }
    private enum CodingKeys: String, CodingKey {
        case first, last
    }
    
    //dummy data
    static func getDummy() -> Self {
        return Name(first: "Heeyun", last: "Kwon")
    }
}

struct Picture: Codable, CustomStringConvertible {
    var large: String
    private enum CodingKeys: String, CodingKey {
        case large
    }
    
    //dummy data
    static func getDummy() -> Self {
        return Picture(large: "https://randomuser.me/api/portraits/women/46.jpg")
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
    
    //dummy data
    static func getDummy() -> Self {
        return Street(number: 63, name: "Netid")
    }
}

struct Login: Codable {
    var password: String
    private enum CodingKeys: String, CodingKey {
        case password
    }
    
    //dummy data
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
        
        return "\(birth[1])/\(birth[2])/\(birth[0])"
    }
    private enum CodingKeys: String, CodingKey {
        case date
    }
    
    //dummy data
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
