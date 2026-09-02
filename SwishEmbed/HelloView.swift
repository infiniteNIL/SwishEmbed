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
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 128)
                .foregroundStyle(.tint)
                .padding(.bottom, 12)

            Text(viewModel.message)
                .bold()
                .italic()
        }
        .padding()
    }
}

#Preview {
    HelloView()
}
