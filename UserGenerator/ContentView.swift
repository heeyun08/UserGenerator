//
//  ContentView.swift
//  UserGenerator
//
//  Created by netid on 2023/02/01.
//

import SwiftUI

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
    
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        ForEach(randomUserViewModel.randomUsers) { aRandomUser in
            UserInfoView(aRandomUser)
        }
        // 새로운 유저 불러오는 버튼
        Button {
            randomUserViewModel.fetchRandomUsers()
        } label: {
            Text("New")
        }
        .buttonStyle(MyBtnStyle())
    }
    func logPrint() {
        dump(randomUserViewModel.randomUsers)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
