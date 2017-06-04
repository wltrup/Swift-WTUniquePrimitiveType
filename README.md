# **WTUniquePrimitiveType**

[![CI Status](http://img.shields.io/travis/wltrup/Swift-WTUniquePrimitiveType.svg?style=flat)](https://travis-ci.org/wltrup/Swift-WTUniquePrimitiveType)
[![Version](https://img.shields.io/cocoapods/v/WTUniquePrimitiveType.svg?style=flat)](http://cocoapods.org/pods/WTUniquePrimitiveType)
[![License](https://img.shields.io/cocoapods/l/WTUniquePrimitiveType.svg?style=flat)](http://cocoapods.org/pods/WTUniquePrimitiveType)
[![Platform](https://img.shields.io/cocoapods/p/WTUniquePrimitiveType.svg?style=flat)](http://cocoapods.org/pods/WTUniquePrimitiveType)

## Motivation

I'm sure it has happened to you that you have in your code properties of the same primitive type but with vastly different semantic meanings. For example, suppose you have the following value types (admittedly, a bizarre example):

```swift
    struct User {

        let id: Int
        let name: String
        var isConnected: Bool
        var coreTemperature: Double
        var numberOfPets: Int

        init(id: Int, name: String, coreTemperature: Double, numberOfPets: Int = 0) {
            self.id = id
            self.name = name
            self.isConnected = false
            self.coreTemperature = coreTemperature
            self.numberOfPets = numberOfPets
        }

    }

    struct NuclearReactor {

        let id: Int
        let name: String
        var isConnected: Bool
        var coreTemperature: Double
        var numberOfFalseAlarms: Int

        init(id: Int, name: String, coreTemperature: Double) {
            self.id = id
            self.name = name
            self.isConnected = false
            self.coreTemperature = coreTemperature
            self.numberOfFalseAlarms = 0
        }

    }
```

Surely, the number of pets a user has and his or her user id have nothing to do with one another. However, the compiler will happily let you set the value of the user id to the count of his pets, as in

```swift
    let numberOfPets = 3
    let user = User(id: numberOfPets, name: "John Doe", coreTemperature: 36.7)
```

Perhaps you'll argue that you wouldn't possibly confuse the user id with his number of pets. Ok, then what about initialising a nuclear reactor using the user's id rather than the reactor's id, as in

```swift
    let userId = 10
    // ... sometime later ...
    let id = userId
    // ... sometime later, after you've forgotten that `id` is set to `userId` ...
    let reactorId = id
    let reactor = NuclearReactor(id: reactorId, name: "Homer's Favorite", coreTemperature: 10_000.0)
```

or initialising a user with the reactor's core temperature, like so:

```swift
    let coreTemp = reactor.coreTemperature
    // ... sometime later ...
    let user2 = User(id: userId, name: "Jim Doe", coreTemperature: coreTemp)
```

These mistakes are far too easy to make and happen far too frequently. Wouldn't it be great if the compiler could warn you when you're setting the user's core temperature with the reactor's core temperature? Or, more generally, when you're trying to set a value of one type to the value of another when both types use the same underlying primitive type for their storage?

Well, that's what this library lets you do.

## How to use

There are four protocols that you need to know about:

- `UniqueBooleanType`: for custom boolean types.
- `UniqueIntegerType`: for custom types based off of any kind of integer.
- `UniqueFloatingPointType`: for custom types based off of any kind of floating point type.
- `UniqueStringType`: for custom string types.

To use them, first declare types like the following somewhere in your project. You'll need them but you won't be using them directly all that often:

```Swift
    struct Id<T>: UniqueIntegerType {
        public typealias PrimitiveType = Int
        public let value: Int
        public init(_ value: Int) {
            self.value = value
        }
    }

    struct CountOf<T>: UniqueIntegerType {
        public typealias PrimitiveType = Int
        public let value: Int
        public init(_ value: Int) {
            self.value = value
        }
    }

    struct Name<T>: UniqueStringType {
        public typealias PrimitiveType = String
        public let value: String
        public init(_ value: String) {
            self.value = value
        }
    }

    struct Connected<T>: UniqueBooleanType {
        public typealias PrimitiveType = Bool
        public let value: Bool
        public init(_ value: Bool) {
            self.value = value
        }
    }

    struct CoreTemperature<T>: UniqueFloatingPointType {
        public typealias PrimitiveType = Double
        public let value: Double
        public init(_ value: Double) {
            self.value = value
        }
    }
```

You could also create types that are not generic and types that aren't structs. For instance, if in your application the only type that supports passwords is the `User` type and you want to make the password a class rather than a struct, then you could declare something like this:
```Swift
    class Password: UniqueIntegerType {
        public typealias PrimitiveType = Int
        public let value: Int
        public init(_ value: Int) {
            self.value = value
        }
    }
```

Regardless, the next thing to do is to create your actual data types, like so:

```swift
    typealias UserId = Id<User>
    typealias UserName = Name<User>
    typealias UserConnected = Connected<User>
    typealias UserCoreTemperature = CoreTemperature<User>
    typealias CountOfPets = CountOf<Pets> // assuming you have declared a `Pet` type

    struct User {
        let id: UserId
        let name: UserName
        let password: Password
        var isConnected: UserConnected
        var coreTemperature: UserCoreTemperature
        var numberOfPets: CountOfPets
    }

    typealias ReactorId = Id<NuclearReactor>
    typealias ReactorName = Name<NuclearReactor>
    typealias ReactorConnected = Connected<NuclearReactor>
    typealias ReactorCoreTemperature = CoreTemperature<NuclearReactor>
    typealias CountOfFalseAlarms = CountOf<FalseAlarm> // assuming you have declared a `FalseAlarm` type

    struct NuclearReactor {
        let id: ReactorId
        let name: ReactorName
        var isConnected: ReactorConnected
        var coreTemperature: ReactorCoreTemperature
        var numberOfFalseAlarms: CountOfFalseAlarms
    }
```

Now, whenever you try to set values for one property using values from another, or pass values of the wrong type to a function, the compiler will warn you that your types are mismatched. For example, this code block won't compile:

```swift
    let reactor = NuclearReactor(id: 100,
                                 name: "Homer's Favorite",
                                 isConnected: true,
                                 coreTemperature: 10_000.0)

    let coreTemp = reactor.coreTemperature

    let user2 = User(id: 5,
                     name: "Jim Doe",
                     isConnected: false,
                     coreTemperature: coreTemp)
```

because you're trying to set the user's core temperature to the reactor's core temperature. Here's a screen shot of the warning I get from Xcode in this case:

![sample warning](https://github.com/wltrup/Swift-WTUniquePrimitiveType/blob/master/sample_warning.png)

But, wait! Have you noticed that I didn't have to use the long form for calling the initialisers of the new types we created, as in the code below?

```swift
    let reactor = NuclearReactor(id: ReactorId(100),
                                 name: ReactorName("Homer's Favorite"),
                                 isConnected: ReactorConnected(true),
                                 coreTemperature: ReactorCoreTemperature(10_000.0))
```

That's because these types conform to protocols such as `ExpressibleByIntegerLiteral`, where appropriate, and that lets you use literal values rather than explicit initialiser calls. Unfortunately, that's only the case if these are literals. You may sometimes have to write things like

```swift
    let userName = UserName("John Doe [\(userId.description)]")
```

because the compiler won't accept

```swift
    let userName = "John Doe [\(userId.description)]"
```

since the right-hand-side is no longer a literal value.

### Support for Arrays, Sets, and Dictionaries

But, wait! There's more!

What if you have, say, an array of user ids? How do you process the primitive values hidden inside? Easy. You use the `boxed()` and `unboxed()` functions. For example,
```swift
    let array1 = [1, 2, 3]
    let userIds: [UserId] = array1.boxed()
```
will create an array of `UserId` instances from an array of the primitive type (in this case, `Int`). Similarly,
```swift
    let array2: [Int] = userIds.unboxed()
```
will give you back an array of the primitive values tucked inside.

This ease of going back-and-forth between the boxed and unboxed variants of collections of your custom types applies to instances of `Array`, `Set`, and `Dictionary`. For example, you could have a dictionary mapping user ids to user names, like this:

```swift
var userIdToUserNameMap: [UserId, UserName] = [:]
```

Wait... don't you have to worry about making the dictionary key type conform to `Hashable`? No, you don't, because primitive types are already hashable and the underlying protocol that makes this library work uses that fact to implement `Hashable` on your behalf. As a result, all your custom `WTUniquePrimitiveType` creations aready conform to `Hashable`. They're also `Equatable` and `Comparable` too!

### Arithmetic operations

That is something I haven't done yet but they will be added to `version 1.1` of this library, so stay tuned. For now, you'll have to resort to access the internal values by using the getter property `value`, as in:

```swift
let total = user.numberOfPets.value + 3
```

Soon you'll be able to write

```swift
let total = user.numberOfPets + 3
```

instead, and will then be warned if you write

```swift
let total = user.numberOfPets + reactor.numberOfFalseAlarms
```

Well, you get warned now too but for a different reason, namely, that the operator `+` can't be applied with operands of the given types.

## Tests

The library enjoys 100% test coverage.

## How it works

There is a base protocol

```swift
public protocol WTUniquePrimitiveType: CustomStringConvertible, Equatable, Comparable, Hashable {

    associatedtype PrimitiveType: CustomStringConvertible, Equatable, Comparable, Hashable

    var value: PrimitiveType { get }
    init(_ value: PrimitiveType)

}
```

requiring any conforming types to declare storage of the appropriate type and an initialiser for that storage.

Then, there are second-level protocols for the individual primitive types. For example, here's the protocol for any primitive that's based off of an `Integer`:

```swift
public protocol UniqueIntegerType: WTUniquePrimitiveType, ExpressibleByIntegerLiteral {

    associatedtype PrimitiveType: Integer

}
```

The rest is just a matter of using protocol extensions to implement the common behavior that you expect these types to have.

## Requirements

This library was built with and for Swift 3.1 and Xcode 8.3.2.

## Installation

**WTUniquePrimitiveType** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "WTUniquePrimitiveType"
```

## Author

wltrup, trupwl@gmail.com

## License

**WTUniquePrimitiveType** is available under the MIT license. See the LICENSE file for more info.
