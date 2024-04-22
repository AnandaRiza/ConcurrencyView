//
//  SymbolVM.swift
//  ConcurrencyView
//
//  Created by MACBOOK PRO on 22/04/24.
//

import Foundation

class SymbolVM: ObservableObject {
    @Published var symbols: [Symbol] = Symbol.dummyData
    
    
    // MARK : - ASYNCHRONOUS
    func downloadImageWithoutBlockingUI() async {
        let urlString = "https://res.cloudinary.com/dph1aandw/image/upload/v1713407486/samples/man-on-a-escalator.jpg?uuid=\(UUID().uuidString)-date : \(Date())"
        
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            print(data)
            print(url)
        }catch {
            print("Error Downloading Image")
        }
        
    }
    
    
    
    
    // MARK : - SYNCHRONOUS
    func downloadImageAndBlockUI() {
        let urlString = "https://res.cloudinary.com/dph1aandw/image/upload/v1713407486/samples/man-on-a-escalator.jpg?uuid=\(UUID().uuidString)-date : \(Date())"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        DispatchQueue.global().sync{
            Thread.sleep(forTimeInterval: 2)
            let output = try? Data(contentsOf: url)
            
            
            print(output!)
            print(url)
        }
        
    }
}
