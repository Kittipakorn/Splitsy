import SwiftUI
import CoreGraphics

struct ContentView: View {
    var pageNumber: Int
    @Binding var currentPage: Int
    @State var howTo: Bool = false
    @State var Setting: Bool = false
    @Binding var currency: String

    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Button {howTo.toggle()} label: {
                        Image(systemName: "questionmark.circle")
                            .font(.system(size: 20))
                    }
                    Spacer()
                    Button {Setting.toggle()} label: {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 20))
                    }
                }
                Spacer()
            }.padding()
            
            VStack() {
                Spacer()
                Spacer()
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400)
                
//                Text("Splitsy")
//                    .bold()
//                    .font(.system(size: 50))
                Spacer()
                
                Button {currentPage+=1} label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 130,height: 40)
                            .cornerRadius(13)
                            .foregroundColor(Color("brown"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                        
                        
                        Text("Start")
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }
                }
                Spacer()
                Button {
                    howTo.toggle()
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 130,height: 40)
                            .cornerRadius(13)
                            .foregroundColor(Color("brown"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                        
                        Text("History")
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }
                }
                Spacer()
                Spacer()
                Spacer()
            }
            if(howTo) {howToView(howTo: $howTo)}
            if(Setting) {SettingView(Setting: $Setting,currency: $currency)}
        }
    }
}
