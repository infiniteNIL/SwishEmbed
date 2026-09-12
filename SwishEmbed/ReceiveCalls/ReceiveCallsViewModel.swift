import Observation
import SwishKit

@Observable
class ReceiveCallsViewModel {
    private let swish: Swish
    var name = ""

    init() {
        swish = Swish()
        do {
            // Registering before loading isn't required — a host function
            // registered afterwards is back-filled into namespaces that already
            // referred clojure.core — but it does mean a failure to load the
            // source can't leave `get-vowels` unregistered.
            swish.register(getVowels, as: "get-vowels", doc: "Returns the vowels in s.")
            try swish.load(filename: "receive-calls.swish")
        }
        catch {
            print("Unable to load receive-calls.swish: \(error)")
        }
    }

    var vowels: String {
        do {
            // Decoding straight into a Set both converts and dedupes, so there's
            // no per-element conversion and no separate uniquing step.
            let found: Set<Character> = try swish.call("vowels", name)
            return found.sorted().map(String.init).joined(separator: ", ")
        }
        catch {
            return "Error: \(error)"
        }
    }

    private func getVowels(_ name: String) -> [Character] {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        return Array(name.lowercased().filter { vowels.contains($0) })
    }
}
