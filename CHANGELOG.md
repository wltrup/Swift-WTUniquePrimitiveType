# WTUniquePrimitiveType

## 1.0.2

- Added the ability for any `UniqueIntegerType`-conforming type to initialise itself with an `Int` and to retrieve the underlying value as an `Int`. The result for either operation is nil when the operation can't be performed.

- Added `TypesafeIntegerIndexType`.

- Added `TypesafeCountType`.

- Added support for returning `TypesafeCountType` instances when querying the size of an `Array`, `Set`, or `Dictionary`.

- Added support for `Array` subscripting using `TypesafeIntegerIndexType` instances.

- Added missing support for hashing a `Dictionary`.

- Streamlined and made the code more homogeneous between the various protocols and their extensions, for ease of reading and understanding.

## 1.0.1

- `UniqueBooleanType` now supports all the standard boolean operators (`!`, `&&`, and `||`).

## 1.0.0

- Initial release.
