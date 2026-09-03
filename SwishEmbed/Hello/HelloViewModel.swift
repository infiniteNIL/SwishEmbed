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
        let source = """
                (hello "Swish")
                """
        if let s = try? swish.eval(source).asString() {
            return s
        }
        else {
            return "Error: Swish eval failed."
        }
    }
}
