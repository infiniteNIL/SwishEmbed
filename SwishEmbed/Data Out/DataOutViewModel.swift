import Foundation
import SwishKit

class DataOutViewModel {
    private let swish: Swish

    init() {
        swish = Swish()
        do {
            try swish.load(filename: "hello.swish")
        }
        catch {
            print("Unable to load hello.swish")
        }
    }

    var message: String {
        let source = """
                (hello "Data Out")
                """
        if let s = try? swish.eval(source).asString() {
            return s
        }
        else {
            return "Error: Swish eval failed."
        }
    }
}
