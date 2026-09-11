import SwiftUI

struct ReceiveCallsView: View {
    @State var viewModel = ReceiveCallsViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Full Name at Birth:")
            TextField("", text: $viewModel.name)
                .frame(height: 32)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 8, style: .circular)
                        .stroke(Color.gray, lineWidth: 1)
                )

            if !viewModel.name.isEmpty {
                Text("Vowels:")
                    .padding(.top, 10)
                
                Text(viewModel.vowels)
                    .bold()
                    .italic()
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ReceiveCallsView()
}
