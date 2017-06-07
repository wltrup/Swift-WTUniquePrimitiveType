//
//  SetSupport.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline

import Foundation


// MARK: - Hashable

// Set already supports Hashing for any type that can be put into a Set.

// MARK: - BOXING

extension Set {

    public func boxed<T: WTUniquePrimitiveType>() -> Set<T> where T.PrimitiveType == Element {
        return Set<T>(self.map { T($0) })
    }

}

// MARK: - UNBOXING

extension Set where Element: WTUniquePrimitiveType {

    public func unboxed() -> Set<Element.PrimitiveType> {
        return Set<Element.PrimitiveType>(
            self.map { (item: Element) -> Element.PrimitiveType in
                return item.value
            }
        )
    }
    
}

// MARK: - COUNT

extension Set {

    // Not added to Collection because Collections don't necessarily have Integer
    // counts. Their general count type is IndexDistance. Set specifies its
    // IndexDistance to an Int.
    public var typesafeCount: TypesafeCountType<Int, Element> {
        return TypesafeCountType<Int, Element>(self.count)
    }
    
}


