//
//  changeFood.swift
//  Splitsy
//
//  Created by Kittiapakorn Seenak on 18/10/2567 BE.
//

import SwiftUI

struct changeFoodView: View {
    @Binding var idx: Int
    @Binding var changeFood: Bool
    @Binding var Item: [Item]
    
    var FoodImg: [String] = ["food00","food01","food02","food03","food04","food05"]
    
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
                            changeFood = false
                        } label: {
                            Image(systemName: "xmark")
                                .bold()
                                .font(.system(size: 20))
                        }
                    }
                    Text("Change Food")
                        .bold()
                        .font(.system(size: 20))
                }
                LazyVGrid(columns: columns,alignment: .center, spacing: 0){
                    ForEach(FoodImg.indices, id: \.self) { index in
                        Button{
                            Item[idx].img = FoodImg[index]
                            changeFood = false
                        } label: {
                            Image(FoodImg[index])
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
