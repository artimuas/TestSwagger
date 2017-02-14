//
//  SpyTestOutputExpectations.swift
//  TestSwagger
//
//  Created by Sam Odom on 1/8/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger

struct SpyTestOutputExpectation {
    let spy: Spy
    let executeSampleMethod: () -> Int
    let output: Int
}
