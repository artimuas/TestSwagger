//
//  IndirectClassSpyControllerTests.swift
//  TestSwagger
//
//  Created by Sam Odom on 1/26/17.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import XCTest
import FoundationSwagger
import SampleTypes
import TestSwagger


class IndirectClassSpyControllerTests: SpyControllerTestCase {

    override var vector: SpyVector {
        return .indirect
    }

    override var methodType: MethodType {
        return .`class`
    }

    
    // MARK: - Swift spies

    func testCannotCreateSwiftSpyWithRootSwiftClass() {
        let swiftRootClass: AnyClass = objc_getClass("SwiftObject") as! AnyClass
        XCTAssertNil(
            SwiftRootSpyable.IndirectClassSpyController.createSpy(on: swiftRootClass.self),
            "Should not be able to create a direct spy with the root Swift class"
        )
    }

    func testCannotCreateSwiftSpyWithNSObject() {
        XCTAssertNil(
            SwiftRootSpyable.IndirectClassSpyController.createSpy(on: NSObject.self),
            "Should not be able to create a direct spy with NSObject"
        )
    }

    func testCannotCreateSwiftSpyWithInvalidSubclass() {
        XCTAssertNil(
            SwiftRootSpyable.IndirectClassSpyController.createSpy(on: URLSession.self),
            "Should not be able to create a direct spy with a class that does not inherit from the spyable class"
        )
    }

    func testCannotCreateSwiftSpyWithRootClass() {
        XCTAssertNil(
            SwiftRootSpyable.IndirectClassSpyController.createSpy(on: SwiftRootSpyable.self),
            "Should not be able to create a direct spy with the root spyable class"
        )
    }

    func testCanCreateSwiftSpyWithDirectSubclass() {
        XCTAssertNotNil(
            SwiftRootSpyable.IndirectClassSpyController.createSpy(on: SwiftInheritor.self),
            "Should be able to create a direct spy with a direct subclass of the root spyable class"
        )
    }

    func testCanCreateSwiftSpyWithIndirectSubclass() {
        XCTAssertNotNil(
            SwiftRootSpyable.IndirectClassSpyController.createSpy(on: SwiftOverriderOfOverrider.self),
            "Should be able to create a direct spy with a direct subclass of the root spyable class"
        )
    }

    func testForwardingSwiftSpyWithContext() {
        language = .swift
        inContext = true
        shouldForwardMethodCalls = true
        createSpyExpectations()

        spyExpectations.forEach { expectation in
            validateSpyExpectation(expectation)
        }
    }

    func testForwardingSwiftSpyWithoutContext() {
        language = .swift
        shouldForwardMethodCalls = true
        createSpyExpectations()

        spyExpectations.forEach { expectation in
            validateSpyExpectation(expectation)
        }
    }

    func testNonForwardingSwiftSpyWithContext() {
        language = .swift
        inContext = true
        createSpyExpectations()

        spyExpectations.forEach { expectation in
            validateSpyExpectation(expectation)
        }
    }

    func testNonForwardingSwiftSpyWithoutContext() {
        language = .swift
        createSpyExpectations()

        spyExpectations.forEach { expectation in
            validateSpyExpectation(expectation)
        }
    }


    // MARK: - Objective-C spies

    func testCannotCreateObjectiveCSpyWithRootSwiftClass() {
        let swiftRootClass: AnyClass = objc_getClass("SwiftObject") as! AnyClass
        XCTAssertNil(
            ObjectiveCRootSpyable.IndirectClassSpyController.createSpy(on: swiftRootClass.self),
            "Should not be able to create a direct spy with the root Swift class"
        )
    }

    func testCannotCreateObjectiveCSpyWithNSObject() {
        XCTAssertNil(
            ObjectiveCRootSpyable.IndirectClassSpyController.createSpy(on: NSObject.self),
            "Should not be able to create a direct spy with NSObject"
        )
    }

    func testCannotCreateObjectiveCSpyWithInvalidSubclass() {
        XCTAssertNil(
            ObjectiveCRootSpyable.IndirectClassSpyController.createSpy(on: URLSession.self),
            "Should not be able to create a direct spy with a class that does not inherit from the spyable class"
        )
    }

    func testCannotCreateObjectiveCSpyWithRootClass() {
        XCTAssertNil(
            ObjectiveCRootSpyable.IndirectClassSpyController.createSpy(on: ObjectiveCRootSpyable.self),
            "Should not be be able to create a direct spy with the root spyable class"
        )
    }

    func testCanCreateObjectiveCSpyWithDirectSubclass() {
        XCTAssertNotNil(
            ObjectiveCRootSpyable.IndirectClassSpyController.createSpy(on: ObjectiveCInheritor.self),
            "Should be able to create a direct spy with a direct subclass of the root spyable class"
        )
    }

    func testCanCreateObjectiveCSpyWithIndirectSubclass() {
        XCTAssertNotNil(
            ObjectiveCRootSpyable.IndirectClassSpyController.createSpy(on: ObjectiveCOverriderOfOverrider.self),
            "Should be able to create a direct spy with a direct subclass of the root spyable class"
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
