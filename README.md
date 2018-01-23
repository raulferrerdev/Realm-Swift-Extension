# Realm: Object extensions




## toJSON() function

This extension works together with [SwiftyJSON framework](https://github.com/SwiftyJSON/SwiftyJSON). So is necessary to install SwiftyJSON through [CocoaPods](http://cocoapods.org/), [Cartahge](https://github.com/Carthage/Carthage) o [The Swift PAckage Manager](https://swift.org/package-manager).    
  

### Installation  

#### Manual

Simply copy the file *Realm+Utilities.swift* to your project and import it in XCode.

##### *Example of use*
```swift
let json = realmObject.toJSON()
```

