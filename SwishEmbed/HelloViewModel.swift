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
        let path = Bundle.main.bundlePath
        swish = Swish(sourcePaths: [path])
        do {
            if let filePath = Bundle.main.path(forResource: "hello", ofType: "swish") {
                try swish.run(filename: filePath)
            }
            else {
                print("Unable to find hello.swish")
            }
        }
        catch {
            print("Unable to load hello.swish: \(error)")
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
