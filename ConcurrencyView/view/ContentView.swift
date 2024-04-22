//
//  ContentView.swift
//  ConcurrencyView
//
//  Created by MACBOOK PRO on 22/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var symbolVM = SymbolVM()
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 100), spacing: 10)
    ]
    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(symbolVM.symbols) {
                        item in
                        Image(systemName: item.name)
                            .padding()
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 100, height: 100)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .trailing, endPoint: .top)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                    }
                  
                }
            }
            .navigationTitle("Symbols")
            .toolbar{
                Button {
                    Task {
                     await symbolVM.downloadImageWithoutBlockingUI()
                    }
                }label: {
                    Image(systemName: "square.and.arrow.down")
                }
                .tint(.black)
            }
        }
    }
}

#Preview {
    ContentView()
}
