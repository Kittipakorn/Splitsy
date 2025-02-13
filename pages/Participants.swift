//
//  Participants.swift
//  Splitsy
//
//  Created by Kittiapakorn Seenak on 18/10/2567 BE.
//

import SwiftUI

struct ParticipantsView: View {
    var pageNumber: Int
    @Binding var currentPage: Int
    @Binding var Participants: [Participant]
    @FocusState var isInputActive: Bool
    
    @State var changeProfile: Bool = false
    @State var idx: Int = 0
    
    var body: some View {
        ZStack{
            VStack {
                ZStack{
                    HStack{
                        Button{
                            currentPage-=1
                        } label: {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.black)
                                .bold()
                        }
                        Spacer()
                        Button{
                            if(Participants.isEmpty) {return}
                            currentPage+=1
                        } label: {
                            Text("Next")
                                .foregroundColor(.black)
                                .bold()
                            
                        }
                    }
                    Text("Participants")
                        .foregroundColor(.black)
                        .bold()
                        .font(.system(size: 30))
                }.padding()
                ScrollView{
                    VStack{
                    ForEach(Participants.indices, id: \.self) { index in
                        ZStack{
                            HStack(spacing: 20){
                                Button{
                                    changeProfile = true
                                    idx = index
                                } label: {
                                    ZStack{
                                        Image(Participants[index].img)
                                            .resizable()
                                            .frame(width: 80,height: 80)
                                            .cornerRadius(100)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 100)
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                        
                                        Image(systemName: "arrow.trianglehead.2.counterclockwise.rotate.90")
                                            .font(.system(size: 12))
                                            .bold()
                                            .padding(3)
                                            .background(Color.brown)
                                            .cornerRadius(100)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 100)
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                            .padding([.leading, .top], 55.0)
                                    }
                                }
                                
                                TextField("Enter Name", text: Binding(
                                    get: { Participants[index].name },
                                    set: { Participants[index].name = $0 }))
                                .font(.system(size: 20))
                                .foregroundStyle(.black)
                                .bold()
                                .focused($isInputActive)
                                .padding(.bottom,3)
                                .overlay(
                                    Rectangle()
                                        .frame(width: 120,height: 1)
                                        .foregroundColor(.black),
                                    alignment: .bottomLeading
                                )
                                
                                Button{Participants.remove(at: index)} label: {
                                    Image(systemName: "trash")
                                        .frame(width: 30,height: 30)
                                        .bold()
                                }
                                
                            }.padding()
                        }.padding()
                            .background(Color("brown"))
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                            .padding( .horizontal)
                    }
                    Button{Participants.append(Participant(name: "", orders: [],price: []))} label: {
                        ZStack{
                            Rectangle()
                                .frame(width: 340,height: 60)
                                .foregroundColor(Color.gray.opacity(0.4))
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                            
                            
                            Text("+")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                        }
                    }
                    }.padding([.top, .leading, .trailing], 3.0)
                }.toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        HStack{
                            Spacer()
                            Button("Done") {
                                isInputActive = false
                            }.foregroundColor(.blue)
                        }
                    }
                }
            }
        }
        if(changeProfile) {changeProfileView(idx: $idx, changeProfile: $changeProfile,Participants: $Participants)}
    }
}
