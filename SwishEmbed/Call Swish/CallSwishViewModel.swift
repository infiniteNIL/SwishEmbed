import Foundation
import SwishKit

/// A Swish `defrecord` read straight into a Swift struct. `SwishCodable` is the
/// whole opt-in — properties map to keyword keys in both directions.
struct Point: Codable, Equatable, SwishCodable {
    var x: Int
    var y: Int
}

class CallSwishViewModel {
    private let swish: Swish

    init() {
        swish = Swish()
        do {
            try swish.load(filename: "call-swish.swish")
        }
        catch {
            print("Unable to load call-swish.swish: \(error)")
        }
    }

    var string: String {
        value { try swish.call("hello", "Data Out") }
    }

    var boolValue: String {
        value { String(describing: try swish.eval("(even? 13)", as: Bool.self)) }
    }

    var char: String {
        value { String(try swish.eval(#"(first "hello")"#, as: Character.self)) }
    }

    var int: String {
        value { String(try swish.call("int-div", 5, 2) as Int) }
    }

    var double: String {
        value { String(try swish.call("double-div", 5, 2) as Double) }
    }

    var july4th: String {
        value {
            let date: Date = try swish.eval(#"#inst "1776-07-04T07:00:00.000-00:00""#)
            return date.formatted(date: .abbreviated, time: .omitted)
        }
    }

    var uuid: String {
        value { try swish.eval("(random-uuid)", as: UUID.self).uuidString }
    }

    /// A vector becomes a `[Int]` with no per-element conversion.
    var array: String {
        value { (try swish.call("one-to-10") as [Int]).map(String.init).joined(separator: ", ") }
    }

    /// Keyword keys read as Swift strings, so this is just a dictionary.
    var dictionary: String {
        value {
            let tally: [String: Int] = try swish.call("tally")
            return tally.sorted { $0.key < $1.key }
                .map { "\($0.key): \($0.value)" }
                .joined(separator: ", ")
        }
    }

    var set: String {
        value { (try swish.call("greetings") as Set<String>).sorted().joined(separator: ", ") }
    }

    /// A `defrecord` decoded into the `Point` struct above.
    var record: String {
        value {
            let point: Point = try swish.call("origin-offset")
            return "x: \(point.x), y: \(point.y)"
        }
    }

    /// `(naturals)` never ends, so it can only be read a bounded slice at a time —
    /// converting it to an array outright would hang.
    var infiniteSequence: String {
        value {
            let first = try swish.eval("(naturals)").prefix(10, of: Int.self)
            return first.map(String.init).joined(separator: ", ") + ", …"
        }
    }

    /// A function Swish handed back, called from Swift.
    var functionValue: String {
        value {
            let addTen = try swish.call("adder", 10)
            return String(try swish.call(addTen, 32) as Int)
        }
    }

    /// A conversion that can't succeed, to show what the error reads like.
    var conversionFailure: String {
        do {
            let _: Int = try swish.eval(#""not a number""#)
            return "unexpectedly succeeded"
        }
        catch {
            return "\(error)"
        }
    }

    /// Runs `body`, turning any Swish error into something displayable.
    private func value(_ body: () throws -> String) -> String {
        do {
            return try body()
        }
        catch {
            return "Error: \(error)"
        }
    }
}
