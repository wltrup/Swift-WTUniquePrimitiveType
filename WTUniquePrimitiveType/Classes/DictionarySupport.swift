//
//  DictionarySupport.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline

import Foundation


// MARK: - Hashable

extension Dictionary where Key: Comparable, Value: Hashable & Comparable {

    public var hashValue: Int {
        let keys = Array(self.keys).sorted()
        let items = Array(self.values).sorted()
        return zip(keys, items)
            .map { (key: Key, item: Value) -> Int in
                return key.hashValue ^ item.hashValue
            }
            .reduce(1.hashValue) { $0 ^ $1 }
    }

}

// MARK: - BOXING

extension Dictionary {

    // Both key and value types are unique primitive types.
    public func boxed<K: WTUniquePrimitiveType, V: WTUniquePrimitiveType>() -> [K: V]
        where K.PrimitiveType == Key, V.PrimitiveType == Value {

            return self
                .map { (key: Key, value: Value) -> (K, V) in
                    return (K(key), V(value))
                }
                .reduce([:]) {
                    (current: [K: V], pair: (key: K, value: V)) -> [K: V] in
                    var new = current
                    new[pair.key] = pair.value
                    return new
            }

    }

    // Only the key type is a unique primitive type.
    public func boxed<K: WTUniquePrimitiveType>() -> [K: Value] where K.PrimitiveType == Key {

        return self
            .map { (key: Key, value: Value) -> (K, Value) in
                return (K(key), value)
            }
            .reduce([:]) {
                (current: [K: Value], pair: (key: K, value: Value)) -> [K: Value] in
                var new = current
                new[pair.key] = pair.value
                return new
        }

    }

    // Only the value type is a unique primitive type.
    public func boxed<V: WTUniquePrimitiveType>() -> [Key: V] where V.PrimitiveType == Value {

        return self
            .map { (key: Key, value: Value) -> (Key, V) in
                return (key, V(value))
            }
            .reduce([:]) {
                (current: [Key: V], pair: (key: Key, value: V)) -> [Key: V] in
                var new = current
                new[pair.key] = pair.value
                return new
        }

    }

}

// MARK: - UNBOXING

// Both key and value types are unique primitive types.
extension Dictionary where Key: WTUniquePrimitiveType, Value: WTUniquePrimitiveType {

    public func unboxed() -> [Key.PrimitiveType: Value.PrimitiveType] {

        typealias KeyVT = Key.PrimitiveType
        typealias ValueVT = Value.PrimitiveType

        return self
            .map { (key: Key, item: Value) -> (KeyVT, ValueVT) in
                return (key.value, item.value)
            }
            .reduce([:]) {
                (current: [KeyVT: ValueVT], item: (key: KeyVT, value: ValueVT)) -> [KeyVT: ValueVT] in
                var new = current
                new[item.key] = item.value
                return new
        }

    }

}


// Only the key type is a unique primitive type.
extension Dictionary where Key: WTUniquePrimitiveType {

    public func unboxed() -> [Key.PrimitiveType: Value] {

        typealias KeyVT = Key.PrimitiveType

        return self
            .map { (key: Key, item: Value) -> (KeyVT, Value) in
                return (key.value, item)
            }
            .reduce([:]) {
                (current: [KeyVT: Value], item: (key: KeyVT, value: Value)) -> [KeyVT: Value] in
                var new = current
                new[item.key] = item.value
                return new
        }

    }

}


// Only the value type is a unique primitive type.
extension Dictionary where Value: WTUniquePrimitiveType {

    public func unboxed() -> [Key: Value.PrimitiveType] {

        typealias ValueVT = Value.PrimitiveType

        return self
            .map { (key: Key, item: Value) -> (Key, ValueVT) in
                return (key, item.value)
            }
            .reduce([:]) {
                (current: [Key: ValueVT], item: (key: Key, value: ValueVT)) -> [Key: ValueVT] in
                var new = current
                new[item.key] = item.value
                return new
        }
        
    }
    
}

// MARK: - COUNT

extension Dictionary {

    public var typesafeCount: TypesafeCountType<Int, Element> {
        return TypesafeCountType<Int, Element>(self.count)
    }

    public var typesafeKeyCount: TypesafeCountType<Int, Key> {
        return TypesafeCountType<Int, Key>(self.keys.count)
    }

    public var typesafeValueCount: TypesafeCountType<Int, Value> {
        return TypesafeCountType<Int, Value>(self.values.count)
    }

}


