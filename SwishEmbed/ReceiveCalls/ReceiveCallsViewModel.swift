import Foundation
import Observation
import SwishKit

@Observable
class ReceiveCallsViewModel {
    private let swish: Swish
    var name = ""

    init() {
        swish = Swish()
        do {
            try swish.load(filename: "receive-calls.swish")
            swish.register(getVowels, as: "get-vowels")
        }
        catch {
            print("Unable to load receive-calls.swish")
        }
    }

    var vowels: String {
        if let chars = try? swish.call("vowels", name).asArray(Character.init) {
            Set(chars.map { "\($0)" })
                .sorted()
                .joined(separator: ", ")
        }
        else {
            "Error: Swish call to vowels failed."
        }
    }

    private func getVowels(_ name: String) -> [Character] {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        var result: [Character] = []
        for ch in name {
            let lowerCh = Character(ch.lowercased())
            if vowels.contains(lowerCh) {
                result.append(lowerCh)
            }
        }
        return result
    }
}
