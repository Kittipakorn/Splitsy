//
//  data.swift
//  Splitsy
//
//  Created by Kittiapakorn Seenak on 18/10/2567 BE.
//
import SwiftUI

class Participant: ObservableObject, Identifiable {
    var id = UUID()
    @Published var name: String
    var img: String = "profile00"
    var total: Double = 0
    var orders: [Int]
    var price: [Double]
    
    init(name: String,orders: [Int],price: [Double]) {
        self.name = name
        self.orders = orders
        self.price = price
    }
}

class Item: ObservableObject, Identifiable {
    var id = UUID()
    @Published var name: String
    var img: String = "food00"
    var price: Double? = 0
    var division: [Int]
    
    init(name: String,division: [Int]) {
        self.name = name
        self.division = division
    }
}
