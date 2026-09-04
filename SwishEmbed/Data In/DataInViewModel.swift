import Foundation
import SwishKit

class DataInViewModel {
    private let swish: Swish

    init() {
        swish = Swish()
        do {
            try swish.load(filename: "data-in.swish")
        }
        catch {
            print("Unable to load data-in.swish")
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
