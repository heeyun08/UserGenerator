//
//  ButtonView.swift
//  UserGenerator
//
//  Created by netid on 2023/02/07.
//

import Foundation
import SwiftUI

//Menu Button
struct Menu: View {
    @Binding var title: String
    @Binding var info: String
    var randomUser: RandomUser
    var btnName = ""
    @Binding var update: Bool
    
    var body: some View {
        Button {
            menuChange(btn: btnName)
        } label: {
            Image(systemName: btnName)
                .frame(width: 50, height: 20)
        }
    }
    
    //Button action
    func menuChange(btn: String) {
        update = true
        switch btn{
        case "person":
            title = "Hi, My name is"
            info = randomUser.name.description
        case "mail":
            title = "My email address is"
            info = randomUser.email
        case "calendar":
            title = "My birthday is"
            info = randomUser.dob.description
        case "map":
            title = "My address is"
            info = randomUser.location.street.description
        case "phone":
            title = "My phone number is"
            info = randomUser.description
        case "lock":
            title = "My password is"
            info = randomUser.login.password
        default:
            break
        }
    }
}

//"New" Button Style
struct NewBtnStyle: ButtonStyle {
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
