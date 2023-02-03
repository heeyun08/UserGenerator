//
//  RandomUserViewModel.swift
//  UserGenerator
//
//  Created by netid on 2023/02/03.
//

import Foundation
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject {
    //MARK: Properties
    var subscription = Set<AnyCancellable>() //Combine
    
    @Published var randomUsers = [RandomUser]()
    
    var baseUrl = "https://randomuser.me/api/?results=1"
    
    init() {
        print("init!!!")
        //RandomUserViewModel 생성될 때 동시에 API 통신
        fetchRandomUsers()
    }
    
    func fetchRandomUsers() {
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap { $0.value } //Combine -> 자동으로 unrapping
            .map { $0.results } //results만 가져옴
            .sink (receiveCompletion: { completion in
                print("데이터 스트림 완료")
            }, receiveValue: { receiveValue in //receiveValue: [RandomUser]
                print("받은 값: \(receiveValue.count)")
                //unrapping해서 RandomUserPesponse에 있는 results 바로 가져올 수 있음
                self.randomUsers = receiveValue
            }).store(in: &subscription) //구독이 완료됐을때 메모리에 날려줌
    }
}
