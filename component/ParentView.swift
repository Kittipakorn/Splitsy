//
//  Parent.swift
//  Splitsy
//
//  Created by Kittiapakorn Seenak on 18/10/2567 BE.
//
import SwiftUI

struct ParentView: View {
        @State private var currentPage: Int = 0
        @State private var Participants: [Participant] = []
    @State private var items: [Item] = []
        @State private var totalPrice: Double = 0
        @State var check = [[Bool]](repeating: [Bool](repeating: false, count: 100), count: 100)

    @AppStorage("currency") var currency: String = "USD - $"
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(
                    LinearGradient(gradient: Gradient(colors: [.brown,.brown, .gray]), startPoint: .top, endPoint: .bottom).opacity(0.2)
                    )
            
            
            
            
            switch currentPage {
            case 0:
                ContentView(pageNumber: 1, currentPage: $currentPage,currency: $currency)
                    .background(
                        Image("bg")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                    )
            case 1:
                ParticipantsView(pageNumber: 2, currentPage: $currentPage, Participants: $Participants)
            case 2:
                ItemsView(pageNumber: 3, currentPage: $currentPage, currency: $currency, Participants: $Participants, items: $items, totalPrice: $totalPrice,check: $check)
            case 3:
                SummaryView(pageNumber: 4, currentPage: $currentPage, currency: $currency, Participants: $Participants, items: $items , totalPrice: $totalPrice)
            default:
                Text("Default View")
            }
        }
    }
}
