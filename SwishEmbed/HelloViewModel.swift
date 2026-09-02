//
//  HelloViewModel.swift
//  SwishEmbed
//
//  Created by Rod Schmidt on 8/31/26.
//

import Foundation
import SwishKit

class HelloViewModel {
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
        do {
            let source = """
                (hello "Swish")
                """
            let result = try swish.eval(source)
            if case let .string(s) = result {
                return s
            }
            else {
                return "Swish didn't return a string."
            }
        }
        catch {
            return "Error: \(error)"
        }
    }
}
