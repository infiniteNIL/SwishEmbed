import SwiftUI

struct CallSwishView: View {
    @State var viewModel = CallSwishViewModel()

    var body: some View {
        List {
            Section("Scalars") {
                LabeledContent("String", value: viewModel.string)
                LabeledContent("Bool", value: viewModel.boolValue)
                LabeledContent("Character", value: viewModel.char)
                LabeledContent("Int", value: viewModel.int)
                LabeledContent("Double", value: viewModel.double)
                LabeledContent("Date", value: viewModel.july4th)
                LabeledContent("UUID", value: viewModel.uuid)
            }

            Section("Collections") {
                LabeledContent("Array", value: viewModel.array)
                LabeledContent("Dictionary", value: viewModel.dictionary)
                LabeledContent("Set", value: viewModel.set)
            }

            Section("Beyond the basics") {
                LabeledContent("Record", value: viewModel.record)
                LabeledContent("Infinite seq", value: viewModel.infiniteSequence)
                LabeledContent("Function value", value: viewModel.functionValue)
                LabeledContent("Failure", value: viewModel.conversionFailure)
            }
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    CallSwishView()
}
