<img src="https://github.com/jwd-ali/TidalTestProject/blob/master/images/header/header.png">
<img align="right" src="https://github.com/jwd-ali/WifiView/blob/main/Images/wifi.gif" width="480" />
<p><h1 align="left">WifiView</h1></p>

[![CI Status](https://travis-ci.org/jwd-ali/RingPieChart.svg)](https://travis-ci.org/jwd-ali/RingPieChart)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/RingPieChart.svg?style=flat)](https://cocoapods.org/pods/RingPieChart)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-0473B3.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/RingPieChart.svg?style=flat)](https://cocoapods.org/pods/RingPieChart)
[![Platform](https://img.shields.io/cocoapods/p/RingPieChart.svg?style=flat)](https://cocoapods.org/pods/RingPieChart)
[![Swift 5.1](https://img.shields.io/badge/swift-5.1-orange)](https://swift.org)

<p><h4>WifiView is animateable UIView that can significantly enhance your users’ experiences and set your app apart from the rest of the pack.</h4></p>

___

It is build using CABasicAnimation, CAKeyFrameAnimation and CAShapeLayer through UIBezierpath. Its fun to play with CoreGraphics.It starts slow and By the end, you’ll be able to create stunning graphics for your apps.
<p> 
  
  <a href="https://www.linkedin.com/in/jawad-ali-3804ab24/"><img src="https://i.imgur.com/vGjsQPt.png" width="134" height="34"></a>  

</br></br>
## Requirements

- iOS 11.0+ / Mac OS X 10.9+ / watchOS 2.0+ / tvOS 9.0+
- Xcode 8.0+

## Installation

### [CocoaPods](http://cocoapods.org)

To integrate **WifiView** into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

pod 'WifiView'
```

Then, run the following command:

```bash
$ pod install
```
### [Carthage](http://github.com/Carthage/Carthage)

To integrate `WifiView` into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "jwd-ali/WifiView"
```

### [Swift Package Manager (SPM)](https://swift.org/package-manager)

#### Prerequisites
- OSX


#### Update `Package.swift`
To integrate `WifiView` in your project, add the proper description to your `Package.swift` file:
```swift
// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    dependencies: [
        .package(url: "https://github.com/jwd-ali/WifiView.git")
    ],
    targets: [
        .target(
            name: "YOUR_TARGET_NAME",
            dependencies: ["WifiView"]
        ),
        ...
    ]
)
```

### Manually

If you prefer not to use a dependency manager, you can integrate WifiView into your project manually.

- Add sources into your project:
  - Drag `Sources`

## Usage

> If you are using any dependency manager (pods , carthage , package manager)to integrate WifiView. Import WifiView first:
> ```swift
> import WifiView
> ```

> And for Manuall install you dont need to import anything 

- Init your view with  `WifiView` same as you initialize default `UIView`:
```swift
  let wifiView = WifiView()
```

Animation functions 
```swift
wifiView.startAnimating()
```

This function will animate once .. Every startAnimating function also have completion block 

```swift
wifiView.startAnimating(repeatCount: .infinity)
```

This function will run animation in loop until you stop it

```swift
wifiView.startAnimating(repeatCount: 2, fallback: .twoSignals)
```
This function will run twice and then fallback to two signals
for signal strength we have enum with two cases 

```swift
enum SignalStrength: Int {
    case twoSignals
    case weak
  }
  ```
 See the Demo Xcode project its easy to understand with proper comments on properties .. write me if you didn't get anything L060214@gmail.com
  
  Congratulations! You're done.
  
  ## Contributing

I’d love to have help on this project. For small changes please [open a pull request](https://github.com/jwd-ali/WifiView/pulls), for larger changes please [open an issue](https://github.com/jwd-ali/WifiView/issues) first to discuss what you’d like to see.


License
-------

WifiView is under [MIT](https://opensource.org/licenses/MIT). See [LICENSE](LICENSE) file for more info.
