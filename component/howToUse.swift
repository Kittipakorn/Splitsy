//
//  howToUse.swift
//  Splitsy
//
//  Created by Kittiapakorn Seenak on 18/10/2567 BE.
//

import SwiftUI

struct howToView: View {
    @State var idx = 0
    @Binding var howTo: Bool
    let images = ["howTo1", "howTo2", "howTo3"]
    var body: some View {
            Rectangle()
                .ignoresSafeArea()
                .opacity(0.6)
            
            VStack{
                HStack{
                    Button{if(idx>0) {idx-=1}}
                        label: {
                            ZStack{
                                Circle()
                                    .frame(width: 30)
                                Text("<")
                                    .bold()
                                    .foregroundColor(.white)
                            }.opacity(idx>0 ? 1.0 : 0.0)
                        }
                    
                    Image(images[idx])
                        .resizable()
                        .frame(width: 300,height: 300)
                    
                    Button{
                        if(idx<2) {idx+=1}
                    }
                        label: {
                            ZStack{
                                Circle()
                                    .frame(width: 30)
                                Text(">")
                                    .bold()
                                    .foregroundColor(.white)
                            }.opacity(idx<2 ? 1 : 0)
                        }
                }
                
                Button {
                    howTo.toggle()
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 100,height: 30)
                            .cornerRadius(13)
                        Text("Close")
                            .foregroundColor(.white)
                    }
                    .padding()
                }
            }
    }
}
