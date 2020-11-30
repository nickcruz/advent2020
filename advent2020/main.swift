// Created by nick_cruz on 11/30/20.
// Copyright © 2020 Airbnb Inc. All rights reserved.

import Foundation
import ArgumentParser

struct Advent: ParsableCommand {
    @Argument() var day: Int

    func run() {
        print("Day: \(day)")
    }
}

Advent.main()
