//
//  UserInfoView.swift
//  UserGenerator
//
//  Created by netid on 2023/02/03.
//

import Foundation
import SwiftUI

struct Menu: View {
    @Binding var title: String
    @Binding var info: String
    var randomUser: RandomUser
    var btnName = ""
    
    var body: some View {
        Button {
            menuChange(btn: btnName)
        } label: {
            Image(systemName: btnName)
                .frame(width: 30, height: 20)
        }
    }
    func menuChange(btn: String) {
        switch btn{
        case "person":
            title = "Hi, My name is"
            info = randomUser.name.description
        case "mail":
            title = "My email address is"
            info = "heeyun@example.com"
        case "calendar":
            title = "My birthday is"
            info = "8/16/2000"
        case "map":
            title = "My address is"
            info = "netid"
        case "phone":
            title = "My phone number is"
            info = "010-1234-5678"
        case "lock":
            title = "My password is"
            info = "mylife"
        default:
            break
        }
    }
}


struct UserInfoView: View {
    var randomUser: RandomUser
    @State private var info = " "
    
    init(_ randomUser: RandomUser) {
        self.randomUser = randomUser
        self.info = randomUser.name.description //???????
    }
    
    @State private var title = "Hi, My name is"
    
    private let btnImg = [
        "person", "mail", "calendar",
        "map", "phone", "lock",
    ]
    var body: some View {
//        var user = randomUser
        VStack{
            //프로필 이미지
            ProfileImgView(imgUrl: randomUser.profileImgUrl)
            //유저 정보
            Text(title)
                .foregroundColor(.gray)
                .padding(.top, 10)
            Text(info)
                .font(.largeTitle)
            //메뉴 버튼
            HStack(spacing: 20){
                ForEach(0..<6, id: \.self) { i in
                    Menu(title: $title, info: $info, randomUser: randomUser, btnName: btnImg[i])
                }
            }
            .padding(.bottom, 10)
            
        }
        .padding(.horizontal, 100)
        .padding(50)
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(RandomUser.getDummy())
    }
}
