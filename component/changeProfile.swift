//
//  changeProfile.swift
//  Splitsy
//
//  Created by Kittiapakorn Seenak on 18/10/2567 BE.
//

import SwiftUI

struct changeProfileView: View {
    @Binding var idx: Int
    @Binding var changeProfile: Bool
    @Binding var Participants: [Participant]
    
    var ProfileImg: [String] = ["profile01","profile02","profile03","profile04","profile05","profile00"]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black)
                .opacity(0.6)
            VStack{
                ZStack{
                    HStack{
                        Spacer()
                        Button{
                            changeProfile = false
                        } label: {
                            Image(systemName: "xmark")
                                .bold()
                                .font(.system(size: 20))
                        }
                    }
                    Text("Change Profile")
                        .bold()
                        .font(.system(size: 20))
                }
                LazyVGrid(columns: columns,alignment: .center, spacing: 0){
                    ForEach(ProfileImg.indices, id: \.self) { index in
                        Button{
                            Participants[idx].img = ProfileImg[index]
                            changeProfile = false
                        } label: {
                            Image(ProfileImg[index])
                                .resizable()
                                .cornerRadius(100)
                                .frame(width: 100,height: 100)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 100)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                        }.padding()
                    }
                }
            }.padding()
                
                .background(Color.white)
                .padding()
                .cornerRadius(10)
        }
    }
}
