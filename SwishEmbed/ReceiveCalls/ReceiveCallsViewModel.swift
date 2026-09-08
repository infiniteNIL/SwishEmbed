import Foundation
import SwishKit

class ReceiveCallsViewModel {
    private let swish: Swish

    init() {
        swish = Swish()
        do {
            try swish.load(filename: "receive-calls.swish")
        }
        catch {
            print("Unable to load receive-calls.swish")
        }
    }

    var message: String {
        let source = """
                (hello "Data In")
                """
        if let s = try? swish.eval(source).asString() {
            return s
        }
        else {
            return "Error: Swish eval failed."
        }
    }
}
