//
//  ContentView.swift
//  PortfolioApp
//
//  Created by yuutoku kouno on 2021/12/01.
//

import SwiftUI

struct ContentView: View {
    @State var str:String = ""
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            TextField("textfiled",text: $str)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
