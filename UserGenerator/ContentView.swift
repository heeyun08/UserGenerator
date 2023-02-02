//
//  ContentView.swift
//  UserGenerator
//
//  Created by netid on 2023/02/01.
//

import SwiftUI

struct Menu: View {
    @Binding var title: String
    @Binding var info: String
    
    var imgName = ""
    
    var body: some View {
        Button {
            btnAction(img: imgName)
        } label: {
            Image(systemName: imgName)
                .frame(width: 30, height: 20)
        }
    }
    func btnAction(img: String) {
        switch img{
        case "person":
            title = "Hi, My name is"
            info = "Kwon Hee Yun"
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

struct MyBtnStyle: ButtonStyle {
    var btnColor: Color = .green
    var btnRadius: CGFloat = 5
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.horizontal, 30)
            .padding(10)
            .background(RoundedRectangle(cornerRadius: btnRadius).fill(btnColor))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct ContentView: View {
    @State private var title = "Hi, My name is"
    @State private var info = "Hong Gil Dong"
    private let btnImg = [
        "person", "mail", "calendar",
        "map", "phone", "lock",
    ]
    var body: some View {
        VStack{
            //프로필 이미지
            Circle()
                .frame(width: 150, height: 150)
            //유저 이름
            Text(title)
                .foregroundColor(.gray)
                .padding(.top, 10)
            Text(info)
                .font(.largeTitle)
            //메뉴버튼
            HStack{
                ForEach(0..<6, id: \.self) { i in
                    Menu(title: $title, info: $info, imgName: btnImg[i])
                }
            }
            .padding(.bottom, 10)
            //새로운 유저 불러오는 버튼
            Button {
                //todo: "New" btton action
            } label: {
                Text("New")
            }
            .buttonStyle(MyBtnStyle())
        }
        .padding(.horizontal, 100)
        .padding(50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
