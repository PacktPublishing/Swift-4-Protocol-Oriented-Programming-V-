//: Playground - noun: a place where people can play

import Foundation

var str = "Hello, playground"

func testGenericComparable<T: Comparable>(a: T, b: T) -> Bool{
    return a == b
}

func testFunction<T: MyClass, E: MyProtocol>(a: T, b: E) {
}
