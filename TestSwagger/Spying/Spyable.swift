//
//  Spyable.swift
//  TestSwagger
//
//  Created by Sam Odom on 12/11/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger

/// A protocol for classes with instance methods and/or properties upon which one would like to spy.
public protocol SpyableObject: class, AssociatingObject {}


/// A protocol for classes with class methods and/or properties upon which one would like to spy.
public protocol SpyableClass: class, AssociatingClass {}
