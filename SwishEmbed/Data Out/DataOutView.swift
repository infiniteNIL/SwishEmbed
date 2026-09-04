import SwiftUI

struct DataOutView: View {
    @State var viewModel = DataOutViewModel()

    var body: some View {
        List {
            Text("Array: 1..10: \(viewModel.array)")
            Text("Bool: 13 is even is \(viewModel.boolValue)")
            Text("Char: First of \"hello\": \(viewModel.char)")
            Text("Date: July 4th: \(viewModel.july4th)")
            Text("Dictionary: \(viewModel.dict)")
            Text("Double: 5 / 2: \(viewModel.double)")
            Text("Float: 5 / 2: \(viewModel.float)")
            Text("Int: 5 / 2: \(viewModel.int)")
            Text("Seq: 1..10: \(viewModel.sequence)")
            Text("Regex: \(viewModel.regex)")
            Text("Set: \(viewModel.set)")
            Text("String: \(viewModel.string)")
            Text("UUID: \(viewModel.uuid)")

            Spacer()
        }
        .listStyle(.plain)
        .padding()
    }
}

#Preview {
    DataOutView()
}
