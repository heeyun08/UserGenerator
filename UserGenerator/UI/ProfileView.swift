//
//  ProfilingView.swift
//  UserGenerator
//
//  Created by netid on 2023/02/03.
//

import Foundation
import SwiftUI
import URLImage


struct ProfileImgView: View {
    var imgUrl: URL
    
    var body: some View {
        VStack{
            
            URLImage(imgUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(Circle().stroke(.gray, lineWidth: 5))
            .padding(20)
        }
    }
}

struct ProfileImgView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://randomuser.me/api/portraits/men/11.jpg")!
        ProfileImgView(imgUrl: url)
    }
}
