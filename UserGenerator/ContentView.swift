//
//  ContentView.swift
//  UserGenerator
//
//  Created by netid on 2023/02/01.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        VStack(spacing: 0){
            ForEach(randomUserViewModel.randomUsers) { aRandomUser in
                UserInfoView(aRandomUser)
            }
            //새로운 유저 불러오는 버튼
            Button("New") {
                randomUserViewModel.fetchRandomUsers()
            }
            .buttonStyle(NewBtnStyle())
            .frame(width: 200, height: 150)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
