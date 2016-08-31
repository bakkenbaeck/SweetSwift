# SweetSwift

[![Version](https://img.shields.io/cocoapods/v/SweetSwift.svg?style=flat)](https://cocoapods.org/pods/SweetSwift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/bakkenbaeck/SweetSwift)
![platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20OS%20X%20%7C%20watchOS%20%7C%20tvOS%20-lightgrey.svg)
[![License](https://img.shields.io/cocoapods/l/SweetSwift.svg?style=flat)](https://cocoapods.org/pods/DATAStack)


## Enums

**SweetSwift** adds a count variable to your Enum so you can avoid having a special case for this.

A comment scenario would be that you use enums in your UITableViewController to separate the different sections, for example:

```swift
enum SectionType: Int {
    case title, price, others, delete, count
}

override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return SectionType.count.rawValue
}
```

After adding **SweetSwift** you would do something like this instead:
```swift
import SweetSwift

enum SectionType: Int {
    case title, price, others, delete
}

override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return SectionType.count
}
```

"Hey, but this doesn't work with String types!"

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

## Installation

**SweetSwift** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SweetSwift' , '~> 1'
```

**SweetSwift** is also available through [Carthage](https://github.com/Carthage/Carthage). To install
it, simply add the following line to your Cartfile:

```ruby
github "bakkenbaeck/SweetSwift"
```

## License

**SweetSwift** is available under the MIT license. See the LICENSE file for more info.

## Author

Bakken & Bæck, [@bakkenbaeck](https://twitter.com/bakkenbaeck)
