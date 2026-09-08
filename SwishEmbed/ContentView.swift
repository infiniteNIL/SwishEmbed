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

            Tab("Call Swish", systemImage: "phone.arrow.up.right") {
                CallSwishView()
            }

            Tab("Receive Calls", systemImage: "phone.arrow.down.left") {
                ReceiveCallsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
