//
//  Summary.swift
//  Splitsy
//
//  Created by Kittiapakorn Seenak on 18/10/2567 BE.
//

import SwiftUI

struct SummaryView: View {
    var pageNumber: Int
    @Binding var currentPage: Int
    @Binding var currency: String
    @Binding var Participants : [Participant]
    @Binding var items : [Item]
    @Binding var totalPrice: Double
    @State private var formattedDate: String = "-"

    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack {
            VStack{
                ZStack{
                    HStack{
                        Button{currentPage-=1} label: {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.black)
                                .bold()
                        }
                        Spacer()
                        Button{
                            currentPage=0
//                            print(currentTimeZone.identifier)
                        } label: {
                            Text("Home")
                                .foregroundColor(.black)
                                .bold()
                        }
                    }
                    Text("Summary")
                        .foregroundColor(.black)
                        .bold()
                        .font(.system(size: 30))
                }
                Text(formattedDate)
            }.padding()
            ScrollView{
                VStack{
                    ForEach(Participants.indices, id: \.self) { index in
                        VStack{
                            HStack(spacing: 20){
                                Image(Participants[index].img)
                                    .resizable()
                                    .frame(width: 70,height: 70)
                                    .cornerRadius(100)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 100)
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                                ZStack{
                                    HStack{
                                        Text(Participants[index].name)
                                            .font(.system(size: 20))
                                            .foregroundStyle(.black)
                                            .bold()
                                        Spacer()
                                    }
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Spacer()
                                            Text("Total: " + String(format: "%.2f", Participants[index].total)+" \(currency[currency.index(before: currency.endIndex)])")
                                                .font(.system(size: 15))
                                                .foregroundStyle(.black)
                                                .bold()
                                        }
                                    }
                                }
                            }
                            Divider()
                            HStack{
                                Text("Order")
                                    .bold()
                                Spacer()
                                Text("Price")
                                    .bold()
                            }
                            ForEach(Participants[index].orders.indices, id: \.self) { orderIndex in
                                let idx = Participants[index].orders[orderIndex]
                                let itemTmp : Item = items[idx]
                                HStack{
                                    Image(itemTmp.img)
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .cornerRadius(100)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 100)
                                                .stroke(Color.black, lineWidth: 1)
                                        )
                                    Text("\(itemTmp.name)")
                                    Spacer()
                                    Text(String(format: "%.2f", Participants[index].price[orderIndex])+" \(currency[currency.index(before: currency.endIndex)])")
                                }
                            }
                            
                        }.padding()
                            .background(Color("brown"))
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                        .stroke(.black, lineWidth: 2)
                            )
                            .padding( .horizontal,20)
                    }
                    Text("*Prices will be rounded up sequentially, starting from the first participant.")
                        .foregroundColor(.gray)
                        .italic()
                        .font(.system(size: 10))
                        .padding(.top, 5.0)
                }.padding([.top, .leading, .trailing], 3.0)
            }
            HStack{
                Spacer()
                Text("Total: \(String(format: "%.2f", totalPrice)) \(currency[currency.index(before: currency.endIndex)])")
                    .bold()
                    .font(.system(size: 20))
            }.padding()
                .background(Color.white.opacity(1))
        }.onReceive(timer) { _ in
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm -  dd MMM YYYY"
            formatter.timeZone = TimeZone.current
            formattedDate = formatter.string(from: Date())
        }
    }
}
