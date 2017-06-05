//
//  AppTypes.swift
//  WTUniquePrimitiveTypes
//
//  Created by Wagner Truppel on 31/05/2017.
//  Copyright © 2017 wtruppel. All rights reserved.
//

// swiftlint:disable vertical_whitespace
// swiftlint:disable trailing_newline
// swiftlint:disable file_length
// swiftlint:disable type_body_length

// swiftlint:disable variable_name

import Foundation
import WTUniquePrimitiveType


typealias UserId = Id<User>
typealias UserName = Name<User>
typealias UserConnected = Connected<User>
typealias UserCoreTemperature = CoreTemperature<User>

struct User {
    let id: UserId
    let name: UserName
    let isConnected: UserConnected
    let coreTemperature: UserCoreTemperature
}


typealias ReactorId = Id<NuclearReactor>
typealias ReactorName = Name<NuclearReactor>
typealias ReactorConnected = Connected<NuclearReactor>
typealias ReactorCoreTemperature = CoreTemperature<NuclearReactor>

struct NuclearReactor {
    let id: ReactorId
    let name: ReactorName
    let isConnected: ReactorConnected
    let coreTemperature: ReactorCoreTemperature
}


