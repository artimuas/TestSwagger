//
//  IndirectObjectSpyControllerTests.swift
//  TestSwagger
//
//  Created by Sam Odom on 1/25/17.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import XCTest
import SampleTypes
import FoundationSwagger
import TestSwagger


class IndirectObjectSpyControllerTests: SpyControllerTestCase {

    override var vector: SpyVector {
        return .indirect
    }

    override var methodType: MethodType {
        return .instance
    }


    // MARK: - Swift spies

    func testCannotCreateSwiftSpyWithRootClass() {
        XCTAssertNil(
            SwiftRootSpyable.IndirectObjectSpyController.createSpy(on: SwiftRootSpyable()),
            "Should not be able to create an indirect spy with an instance of the root spyable class"
        )
    }

    func testCanCreateSwiftSpyWithDirectSubclass() {
        XCTAssertNotNil(
            SwiftRootSpyable.IndirectObjectSpyController.createSpy(on: SwiftInheritor()),
            "Should be able to create an indirect spy with an instance of a direct subclass of the root spyable class"
        )
    }

    func testCanCreateSwiftSpyWithIndirectSubclass() {
        XCTAssertNotNil(
            SwiftRootSpyable.IndirectObjectSpyController.createSpy(on: SwiftOverriderOfOverrider()),
            "Should be able to create an indirect spy with an instance of a direct subclass of the root spyable class"
        )
    }

    func testForwardingSwiftSpyWithContext() {
        inContext = true
        shouldForwardMethodCalls = true
        createSpyExpectations()

        spyExpectations.forEach { expectation in
            validateSpyExpectation(expectation)
        }
    }

    func testForwardingSwiftSpyWithoutContext() {
        shouldForwardMethodCalls = true
        createSpyExpectations()

        spyExpectations.forEach { expectation in
            validateSpyExpectation(expectation)
        }
    }

    func testNonForwardingSwiftSpyWithContext() {
        inContext = true
        createSpyExpectations()

        spyExpectations.forEach { expectation in
            validateSpyExpectation(expectation)
        }
    }

    func testNonForwardingSwiftSpyWithoutContext() {
        createSpyExpectations()

        spyExpectations.forEach { expectation in
            validateSpyExpectation(expectation)
        }
    }


    // MARK: - Objective-C spies

    func testCannotCreateObjectiveCSpyWithRootClass() {
        XCTAssertNil(
            ObjectiveCRootSpyable.IndirectObjectSpyController.createSpy(on: ObjectiveCRootSpyable()),
            "Should not be able to create an indirect spy with an instance of the root spyable class"
        )
    }

    func testCanCreateObjectiveCSpyWithDirectSubclass() {
        XCTAssertNotNil(
            ObjectiveCRootSpyable.IndirectObjectSpyController.createSpy(on: ObjectiveCInheritor()),
            "Should be able to create an indirect spy with an instance of a direct subclass of the root spyable class"
        )
    }

    func testCanCreateObjectiveCSpyWithIndirectSubclass() {
        XCTAssertNotNil(
            ObjectiveCRootSpyable.IndirectObjectSpyController.createSpy(on: ObjectiveCOverriderOfOverrider()),
            "Should be able to create an indirect spy with an instance of a direct subclass of the root spyable class"
        )
    }

    func testForwardingObjectiveCSpyWithContext() {
        language = .objectiveC
        inContext = true
        shouldForwardMethodCalls = true
        createSpyExpectations()

        spyExpectations.forEach { expectation in
            validateSpyExpectation(expectation)
        }
    }

    func testForwardingObjectiveCSpyWithoutContext() {
        language = .objectiveC
        shouldForwardMethodCalls = true
        createSpyExpectations()

        spyExpectations.forEach { expectation in
            validateSpyExpectation(expectation)
        }
    }

    func testNonForwardingObjectiveCSpyWithContext() {
        language = .objectiveC
        inContext = true
        createSpyExpectations()

        spyExpectations.forEach { expectation in
            validateSpyExpectation(expectation)
        }
    }

    func testNonForwardingObjectiveCSpyWithoutContext() {
        language = .objectiveC
        createSpyExpectations()
        
        spyExpectations.forEach { expectation in
            validateSpyExpectation(expectation)
        }
    }
    
}