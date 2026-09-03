import SwiftUI

struct DataInView: View {
    @State var viewModel = HelloViewModel()

    var body: some View {
        VStack {
            Image(systemName: "square.and.arrow.down")
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
    DataInView()
}
