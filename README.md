# SweetSwift

[![Version](https://img.shields.io/cocoapods/v/SweetSwift.svg?style=flat)](https://cocoapods.org/pods/SweetSwift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/BakkenBaeck/SweetSwift)
![platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20OS%20X%20%7C%20watchOS%20%7C%20tvOS%20-lightgrey.svg)
[![License](https://img.shields.io/cocoapods/l/SweetSwift.svg?style=flat)](https://cocoapods.org/pods/DATAStack)

## Table of Contents

* [Date](#date)
* [Int](#int)
* [Installation](#installation)
* [License](#license)
* [Author](#author)


## Date

Easily break down a date into components with our helper method:

```swift
let date = Date()
date.components([.hour, .day, .year])
```

Or create a new date with the day/month/year and optional hour/minute/second components: 

```swift
let date = Date.from(day: 22, month: 1, year: 2018)
```

## Int

Create arrays of a number of things: 

```swift
5.map { "Hello" }
// returns [ "Hello", "Hello", "Hello", "Hello", "Hello" ]
```

or run a given operation a number of times: 
```swift
5.times {
    print("Swift is awesome!")
}
```

## Installation

**SweetSwift** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SweetSwift' , '~> 2'
```

**SweetSwift** is also available through [Carthage](https://github.com/Carthage/Carthage). To install
it, simply add the following line to your Cartfile:

```ruby
github "BakkenBaeck/SweetSwift"
```

## License

**SweetSwift** is available under the MIT license. See the LICENSE file for more info.

## Author

Bakken & Bæck, [@UseSweet](https://twitter.com/UseSweet)
