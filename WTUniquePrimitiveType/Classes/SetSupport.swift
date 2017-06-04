//
//  SetSupport.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

import Foundation


// MARK: - Hashable

extension Set where Element: Hashable {

    public var hashValue: Int {
        return self.map { $0.hashValue }.reduce(1.hashValue) { return $0 ^ $1 }
    }

}

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


