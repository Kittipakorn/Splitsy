//
//  Item.swift
//  Splitsy
//
//  Created by Kittiapakorn Seenak on 18/10/2567 BE.
//

import SwiftUI

struct ItemsView: View {
    var pageNumber: Int
    @Binding var currentPage: Int
    @Binding var currency : String
    @Binding var Participants : [Participant]
    @Binding var items : [Item]
    @Binding var totalPrice: Double
    @Binding var check: [[Bool]]
    @State var changeFood: Bool = false
    @State var idx: Int = 0
    
    @FocusState var isInputActive: Bool
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        ZStack{
            VStack {
                ZStack{
                    HStack{
                        Button{currentPage-=1} label: {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.black)
                                .bold()
                        }
                        Spacer()
                        Button{
                            if(items.isEmpty) {return}
                            totalPrice = 0
                            for i in 0..<items.count {
                                items[i].division = []
                                totalPrice += items[i].price ?? 0
                            }
                            
                            for i in 0..<Participants.count {
                                Participants[i].total = 0
                                Participants[i].orders = []
                                Participants[i].price = []
                            }
                            
                            
                            for i in 0..<items.count {
                                for j in 0..<Participants.count {
                                    if(check[i][j]){
                                        items[i].division.append(j)
                                    }
                                }
                            }
                            
                            for i in 0..<items.count {
                                if(items[i].division.isEmpty) {
                                    continue
                                }
                                var pud: Int = 0
                                var price: Double = (items[i].price ?? 0)/Double(items[i].division.count)
                                let newprice: Double  = floor(price * 100) / 100;
                                price = (items[i].price ?? 0)
                                let tmp: Double = newprice * Double(items[i].division.count)
                                pud = Int(round(Double(price - tmp) * 100))
                                for j in items[i].division {
                                    Participants[j].total += newprice
                                    Participants[j].orders.append(i)
                                    Participants[j].price.append(newprice)
                                    if(pud > 0) {
                                        Participants[j].total += 0.01
                                        pud -= 1
                                        let last = Participants[j].orders.count - 1
                                        Participants[j].price[last] += 0.01
                                    }
                                }
                            }
                            currentPage+=1
                            
                        } label: {
                            Text("Next")
                        }
                    }
                    Text("Oders")
                        .foregroundColor(.black)
                        .bold()
                        .font(.system(size: 30))
                }.padding()
                
                ScrollView{
                    VStack{
                    ForEach(items.indices, id: \.self) { index in
                        ZStack{
                            VStack{
                                HStack(spacing: 20){
                                    
                                    Button{
                                        changeFood = true
                                        idx = index
                                    } label: {
                                        ZStack{
                                            Image(items[index].img)
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
                                    
                                    VStack{
                                        TextField("Order", text: Binding(
                                            get: { items[index].name },
                                            set: { items[index].name = $0 }))
                                        .font(.system(size: 25))
                                        .focused($isInputActive)
                                        .foregroundStyle(.black)
                                        .padding(.bottom,3)
                                        .overlay(
                                            Rectangle()
                                                .frame(width: 120,height: 1)
                                                .foregroundColor(.black),
                                            alignment: .bottomLeading
                                        )
                                        
                                        
                                        HStack{
                                            TextField("Price", text: Binding(
                                                get: { String(items[index].price ?? 0) },
                                                set: { items[index].price = Double($0) ?? 0}))
                                            .keyboardType(.decimalPad)
                                            .focused($isInputActive)
                                            .padding(.bottom,3)
                                            .overlay(
                                                Rectangle()
                                                    .frame(width: 120,height: 1)
                                                    .foregroundColor(.black),
                                                alignment: .bottomLeading
                                            )
                                            
                                            Text(" \(currency[currency.index(before: currency.endIndex)])")
                                        }.font(.system(size: 20))
                                            .foregroundStyle(.black)
                                            .padding(.trailing)
                                    }
                                    Button{items.remove(at: index)} label: {
                                        Image(systemName: "trash")
                                            .frame(width: 30,height: 30)
                                    }
                                }
                                Divider()
                                LazyVGrid(columns: columns,alignment: .leading, spacing: 20){
                                    ForEach(Participants.indices, id: \.self) { index2 in
                                        HStack{
                                            Button{check[index][index2].toggle()} label : {
                                                Image(systemName: (check[index][index2] ? "checkmark.circle.fill": "circle" ))
                                                    .foregroundColor(check[index][index2] ? .blue: .gray)
                                                    .font(.system(size: 20))
                                                
                                            }
                                            Image(Participants[index2].img)
                                                .resizable()
                                                .frame(width: 30,height: 30)
                                                .cornerRadius(100)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 100)
                                                        .stroke(Color.black, lineWidth: 1)
                                                )
                                            Text(Participants[index2].name)
                                                .foregroundColor(.black)
                                                .font(.system(size: 15))
                                                .bold()
                                        }
                                    }
                                }
                            }.padding( .horizontal, 10.0)
                        }.padding()
                            .background(Color("brown"))
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                            .padding( .horizontal)
                    }
                    Button{items.append(Item(name: "", division: []))} label: {
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
                    }
                    .padding([.top, .leading, .trailing], 3.0)
                }
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
            if(changeFood) {changeFoodView(idx: $idx, changeFood: $changeFood, Item: $items)}
        }
    }
}
