# SweetSwift

[![Version](https://img.shields.io/cocoapods/v/SweetSwift.svg?style=flat)](https://cocoapods.org/pods/SweetSwift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/UseSweet/SweetSwift)
![platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20OS%20X%20%7C%20watchOS%20%7C%20tvOS%20-lightgrey.svg)
[![License](https://img.shields.io/cocoapods/l/SweetSwift.svg?style=flat)](https://cocoapods.org/pods/DATAStack)

## Table of Contents

* [Enums](#enums)
* [String](#string)
* [Date](#date)
* [Installation](#installation)
* [License](#license)
* [Author](#author)

## Enums

**SweetSwift** adds a count variable to your Enum so you can avoid having a special case for this.

A common scenario would be that you use enums in your UITableViewController to separate the different sections, for example:

```swift
enum SectionType: Int {
    case title, price, others, delete, count
}

override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return SectionType.count.rawValue
}
```

After adding **SweetSwift** you can do this instead:
```swift
import SweetSwift

enum SectionType: Int {
    case title, price, others, delete
}

override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return SectionType.count
}
```

_"Hey, but this doesn't work with String types!"._

Doesn't matter, you shouldn't be using that anyway since it doesn't provide you a way to return localized variations. So maybe this should be better.

```swift
enum Section: Int {
    case title, price, others, delete

    func toString() -> String? {
        switch self {
        case .title:
            return NSLocalizedString("Title", comment: "")
        case .price:
            return NSLocalizedString("Price", comment: "")
        case .others:
            return NSLocalizedString("Others", comment: "")
        case .delete:
            return nil
        }
    }
}
```

## Strings

**SweetSwift** adds a convenience property to access the length of a `String`.

You'll be able to replace:

```swift
"hello world".characters.count
```

With this:

```swift
"hello world".length
```


## Date
Easily break down a date into components with our helper method:

```swift
let date = Date()
date.components([.hour, .day. year. calendar])
```

## Installation

**SweetSwift** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SweetSwift' , '~> 1'
```

**SweetSwift** is also available through [Carthage](https://github.com/Carthage/Carthage). To install
it, simply add the following line to your Cartfile:

```ruby
github "UseSweet/SweetSwift"
```

## License

**SweetSwift** is available under the MIT license. See the LICENSE file for more info.

## Author

Bakken & Bæck, [@UseSweet](https://twitter.com/UseSweet)
