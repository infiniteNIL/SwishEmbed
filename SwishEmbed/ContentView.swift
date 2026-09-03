//
//  ContentView.swift
//  SwishEmbed
//
//  Created by Rod Schmidt on 8/31/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Hello", systemImage: "globe") {
                HelloView()
            }

            Tab("Data Out", systemImage: "tablecells") {
                DataOutView()
            }

            Tab("Data In", systemImage: "square.and.arrow.down") {
                DataInView()
            }
        }
    }
}

#Preview {
    ContentView()
}
