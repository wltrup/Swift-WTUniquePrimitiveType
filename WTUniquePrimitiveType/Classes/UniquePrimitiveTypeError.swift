//
//  UniquePrimitiveTypeError.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline

import Foundation


public struct UniquePrimitiveTypeError<U,V>: Error {

    public enum Kind {
        case initialization
        case conversion
    }

    public let kind: Kind
    public let sourceValue: U
    public let targetType: V

    public init(kind: Kind, sourceValue: U, targetType: V) {
        self.kind = kind
        self.sourceValue = sourceValue
        self.targetType = targetType
    }

    public var error: NSError {
        switch kind {

        case .initialization:
            // TODO: Localize the error message
            let localizedMessage = "Unable to initialize '\(targetType.self)' with " +
            "value '\(sourceValue) of type '\(sourceValue.self)."
            return NSError(domain: "UniquePrimitiveTypeDomain", code: self.code,
                           userInfo: [NSLocalizedDescriptionKey: localizedMessage])

        case .conversion:
            // TODO: Localize the error message
            let localizedMessage = "Unable to convert value '\(sourceValue)' of type " +
            "'\(sourceValue.self)' to a value of type '\(targetType.self)'."
            return NSError(domain: "UniquePrimitiveTypeDomain", code: self.code,
                           userInfo: [NSLocalizedDescriptionKey: localizedMessage])

        }
    }

    public var code: Int {
        switch kind {
        case .initialization:
            return -1
        case .conversion:
            return -2
        }
    }

}


