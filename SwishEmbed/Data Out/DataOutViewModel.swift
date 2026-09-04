import Foundation
import SwishKit

class DataOutViewModel {
    private let swish: Swish

    init() {
        swish = Swish()
        do {
            try swish.load(filename: "data-out.swish")
        }
        catch {
            print("Unable to load data-out.swish")
        }
    }

    var array: String {
        if let a = try? swish.eval("(one-to-10)").asArray(Expr.toInt) {
            "[" + a.map(String.init).joined(separator: ", ") + "]"
        }
        else {
            "[]"
        }
    }

    var boolValue: String {
        if let b = try? swish.eval("(even? 13)").asBool() {
            String(describing: b)
        }
        else {
            "Error getting Bool"
        }
    }

    var char: String {
        if let c = try? swish.eval("(first \"hello\")").asCharacter() {
            String(describing: c)
        }
        else {
            "Error getting Character"
        }
    }

    var dict: String {
        if let d = try? swish.eval("{:a 1 :b 2}").asDictionary(mapKey: Expr.toString, mapValue: Expr.toInt) {
            return String(describing: d)
        }
        else {
            return "[:]"
        }
    }

    var july4th: String {
        // 0700 to account for UTC
        let date = if let d = try? swish.eval("#inst \"1776-07-04T07:00:00.000-00:00\"").asDate() {
            d
        }
        else {
            Date()
        }

        return date.formatted(date: .abbreviated, time: .omitted)
    }

    var double: String {
        if let d = try? swish.eval("(double-div 5 2)").asDouble() {
            "\(d)"
        }
        else {
            "Error getting double"
        }
    }

    var float: String {
        if let f = try? swish.eval("(double-div 5 2)").asFloat() {
            "\(f)"
        }
        else {
            "Error getting float"
        }
    }

    var int: String {
        if let i = try? swish.eval("(double-div 5 2)").asInt() {
            "\(i)"
        }
        else {
            "Error getting int"
        }
    }

    var sequence: String {
        guard let seq = try? swish.eval("(range 10)").asSequence() else { return "" }
        var result: [String] = []
        for i in seq {
            if let i = i.asInt() {
                result.append("\(i)")
            }
        }
        return result.joined(separator: ", ")
    }

    var regex: String {
        (try? swish.eval("#\"the*.\"").asRegex()) ?? ""
    }

    var set: String {
        let source = """
            (set ["hello" "goodbye" "hello"])
        """

        let result = if let newSet = try? swish.eval(source).asSet(Expr.toString) {
            newSet
        }
        else {
            Set<String>()
        }

        return String(describing: result)
    }

    var string: String {
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

    var uuid: String {
        (try? swish.eval("(random-uuid)").asUUID()?.uuidString) ?? ""
    }
}
