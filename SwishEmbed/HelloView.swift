//
//  HelloView.swift
//  SwishEmbed
//
//  Created by Rod Schmidt on 8/31/26.
//

import SwiftUI

struct HelloView: View {
    @State var viewModel = HelloViewModel()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(viewModel.message)
        }
        .padding()
    }
}

#Preview {
    HelloView()
}
