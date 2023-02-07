//
//  UserInfoView.swift
//  UserGenerator
//
//  Created by netid on 2023/02/03.
//

import Foundation
import SwiftUI

struct UserInfoView: View {
    var randomUser: RandomUser
    
    init(_ randomUser: RandomUser) {
        self.randomUser = randomUser
    }
    
    @State private var title = "Hi, My name is"
    @State private var info = ""
    @State private var update = false
    
    private let btnImg = [
        "person", "mail", "calendar",
        "map", "phone", "lock",
    ]
    
    var body: some View {
        VStack{
            //프로필 이미지
            ProfileImgView(imgUrl: randomUser.profileImgUrl)
            //유저 정보
            Text(title)
                .foregroundColor(.gray)
                .padding(.top, 10)
            Text(update ? info : randomUser.name.description)
                .font(.largeTitle)
                .padding(.bottom, 20)
            //메뉴 버튼
            HStack(spacing: 20){
                ForEach(0..<6, id: \.self) { i in
                    Menu(title: $title, info: $info, randomUser: randomUser, btnName: btnImg[i], update: $update)
                }
            }
        }
        .padding(.horizontal, 100)
        .padding(.top, 50)
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(RandomUser.getDummy())
    }
}
