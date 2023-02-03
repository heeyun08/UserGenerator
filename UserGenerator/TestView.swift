//
//  TestView.swift
//  UserGenerator
//
//  Created by netid on 2023/02/03.
//

import Foundation
import SwiftUI

struct TestView: View {
    var randomUser: RandomUser
    
    init(_ randomUser: RandomUser) {
        self.randomUser = randomUser
    }
    
    var body: some View {
//        List {
//            ForEach(randomUser) { aRandomUser in
//                HStack{
//                    ProfileImgView(imgUrl: aRandomUser.profileImgUrl)
//                    Text("\(aRandomUser.name.description)")
//                }
//                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading)
//                .padding(.vertical)
//            }
//        }
        
        HStack{
            ProfileImgView(imgUrl: randomUser.profileImgUrl)
            Text("\(randomUser.name.description)")
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading)
        .padding(.vertical)


    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(RandomUser.getDummy())
    }
}

