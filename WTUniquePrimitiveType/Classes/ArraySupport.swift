//
//  ArraySupport.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

import Foundation


// MARK: - Hashable

extension Array where Element: Hashable {

    public var hashValue: Int {
        return self.map { $0.hashValue }.reduce(1.hashValue) { return $0 ^ $1 }
    }

}

// MARK: - BOXING

extension Array {

    public func boxed<T: WTUniquePrimitiveType>() -> Array<T> where T.PrimitiveType == Element {
        return self.map { T($0) }
    }

}

// MARK: - UNBOXING

extension Array where Element: WTUniquePrimitiveType {

    public func unboxed() -> Array<Element.PrimitiveType> {
        return self.map { (item: Element) -> Element.PrimitiveType in
            return item.value
        }
    }
    
}


