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

            Tab("Tab 2", systemImage: "2.circle") {
                Text("Tab 2")
            }

            Tab("Tab 3", systemImage: "3.circle") {
                Text("Tab 3")
            }
        }
    }
}

#Preview {
    ContentView()
}
