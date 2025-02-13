//
//  Setting.swift
//  Splitsy
//
//  Created by Kittiapakorn Seenak on 18/10/2567 BE.
//

import SwiftUI

struct SettingView: View {
    @Binding var Setting: Bool
    @Binding var currency: String
    let selectionOptions = ["USD - $", "EUR - €", "JPY - ¥","GBP - £","CNY - ¥","THB - ฿"]

    var body: some View {
            Rectangle()
                .ignoresSafeArea()
                .opacity(0.6)
            
            VStack{
                ZStack{
                    HStack{
                        Spacer()
                        Button{
                            Setting = false
                        } label: {
                            Image(systemName: "xmark")
                                .bold()
                                .font(.system(size: 20))
                        }
                    }
                    Text("Setting")
                        .bold()
                        .font(.system(size: 20))
                }.padding()
                HStack{
                    Text("Currency")
                    Spacer()
                    Picker("Currency", selection: $currency) {
                        ForEach(selectionOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }.padding()
                Spacer()
                Text("Swift Student Challenge 2025")
                    .italic()
                    .foregroundColor(.gray)
                Text("🇹🇭 Kittipakorn Seenak")
                    .italic()
                    .foregroundColor(.gray)
            }.frame(width: 300,height: 350)
            .padding()
            .background(.white)
            
    }
}
