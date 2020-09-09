# ASAppBar

[![CI Status](https://img.shields.io/travis/amitpstu1@gmail.com/ASAppBar.svg?style=flat)](https://travis-ci.org/amitpstu1@gmail.com/ASAppBar)
[![Version](https://img.shields.io/cocoapods/v/ASAppBar.svg?style=flat)](https://cocoapods.org/pods/ASAppBar)
[![License](https://img.shields.io/cocoapods/l/ASAppBar.svg?style=flat)](https://cocoapods.org/pods/ASAppBar)
[![Platform](https://img.shields.io/cocoapods/p/ASAppBar.svg?style=flat)](https://cocoapods.org/pods/ASAppBar)

Screenshots
---------
![ASAppBar Screenshots](asappbar_screenshot.gif)

    
## Import Statement
```swift
import ASAppBar
```

## Outlet Initialization
```swift
@IBOutlet weak var appBar: ASAppBarClassic!
```

## Variables
```swift
static let boxPadding = CGSize(width: 10, height: 0)
static var barTitleProps: ASAProps {ASAProps(ASAMultiplier(5.0, 0.6), CGSize(width: 5, height: 5))}
static var barSearchProps: ASAProps {ASAProps(ASAMultiplier(0.6, 0.6), CGSize(width: 5, height: 0))}
static var barProps: ASAProps {ASAProps(ASAMultiplier(0.6, 0.6), CGSize(width: 5, height: 5))}

let title = ASAChangableView("App Name", {self.initTitleLabel("App Name 1")}, {self.initTitleLabel("App Name 2")}, ViewController.barTitleProps, ViewController.barTitleProps)

let menu = ASAChangableView("Menu", {UIImageView(image: UIImage(named: "menu"))}, {UIImageView(image: UIImage(named: "menu"))}, ViewController.barProps, ViewController.barProps)

let more = ASAChangableView("More", {UIImageView(image: UIImage(named: "moreIcon"))}, {UIImageView(image: UIImage(named: "moreIcon"))}, ViewController.barProps, ViewController.barProps)

let notifi = ASAChangableView("Notification", {UIImageView(image: UIImage(named: "notification"))},{UIImageView(image: UIImage(named: "notification"))}, ViewController.barProps, ViewController.barProps)

let search = ASAChangableView("Search", {UIImageView(image: UIImage(named: "search"))}, {self.initSearchBar()}, ViewController.barProps, ViewController.barSearchProps)

let showMoreProps = ASADropDownProp(UIFont.systemFont(ofSize: 15), UIColor.black, UIColor.lightGray, UIColor.lightGray)
```

## Set Background Color & Box Padding
```swift
self.appBar
.setBackgroundColor(UIColor.blue)
.setBoxPadding(ViewController.boxPadding)
```

## Set Left Side Menu View
```swift
self.appBar
.setSideView("0", menu, true, false, false, .left, { (appbar, subView, isOn) in print("\(isOn)") })
```

## Set Left Side Title View
```swift
self.appBar
.setSideView("1", title, true, false, false, .left, { (appbar, subView, isOn) in print("\(isOn)")})
```

## Set Right Expandable View And It's Event Change Other Size By Id
```swift
self.appBar
.setSideView("4", search, true, false, true, .right, { (appbar, subView, isOn) in print("\(isOn)"); appbar.setMultiplier("1", (isOn ? ASAMultiplier.zero : ViewController.barTitleProps.multiplier)) })
```

## Full Code Snippet
```swift

import UIKit
import ASAppBar

class ViewController: UIViewController {
    @IBOutlet weak var appBar: ASAppBarClassic!
    
    static let boxPadding = CGSize(width: 10, height: 0)
    static var barTitleProps: ASAProps {ASAProps(ASAMultiplier(5.0, 0.6), CGSize(width: 5, height: 5))}
    static var barSearchProps: ASAProps {ASAProps(ASAMultiplier(0.6, 0.6), CGSize(width: 5, height: 0))}
    static var barProps: ASAProps {ASAProps(ASAMultiplier(0.6, 0.6), CGSize(width: 5, height: 5))}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = ASAChangableView("App Name", {self.initTitleLabel("App Name 1")}, {self.initTitleLabel("App Name 2")}, ViewController.barTitleProps, ViewController.barTitleProps)
        
        let menu = ASAChangableView("Menu", {UIImageView(image: UIImage(named: "menu"))}, {UIImageView(image: UIImage(named: "menu"))}, ViewController.barProps, ViewController.barProps)
        
        let more = ASAChangableView("More", {UIImageView(image: UIImage(named: "moreIcon"))}, {UIImageView(image: UIImage(named: "moreIcon"))}, ViewController.barProps, ViewController.barProps)
        
        let notifi = ASAChangableView("Notification", {UIImageView(image: UIImage(named: "notification"))},{UIImageView(image: UIImage(named: "notification"))}, ViewController.barProps, ViewController.barProps)
        
        let search = ASAChangableView("Search", {UIImageView(image: UIImage(named: "search"))}, {self.initSearchBar()}, ViewController.barProps, ViewController.barSearchProps)
        
        let showMoreProps = ASADropDownProp(UIFont.systemFont(ofSize: 15), UIColor.black, UIColor.lightGray, UIColor.lightGray)
        
        self.appBar
            .setBackgroundColorAll(UIColor.blue)
            .setBoxPadding(ViewController.boxPadding)
            .setSideView("0", menu, true, false, false, .left, { (appbar, subView, isOn) in print("\(isOn)") })
            .setSideView("1", title, true, false, false, .left, { (appbar, subView, isOn) in print("\(isOn)")})
            .setSideView("2", more, true, false, false, .right, { (appbar, subView, isOn) in appbar.showMore(subView, showMoreProps.background, showMoreProps, {(index, title) in print("title: \(title)")}); print("\(isOn)")})
            .setSideView("3", notifi, true, false, false, .right, { (appbar, subView, isOn) in print("\(isOn)")})
            .setSideView("4", search, true, false, true, .right, { (appbar, subView, isOn) in print("\(isOn)"); appbar.setMultiplier("1", (isOn ? ASAMultiplier.zero : ViewController.barTitleProps.multiplier)) })
            .setSideView("5", notifi, false, false, false, .right, { (appbar, subView, isOn) in print("\(isOn)")})
            .setSideView("6", more, false, false, false, .right, { (appbar, subView, isOn) in print("\(isOn)")})
    }
    
    func initTitleLabel(_ text: String? = nil) -> UILabel {
        let label = UILabel()
        label.text = text ?? ""
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }
    
    func initSearchBar() -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = "Search..."
        searchBar.sizeToFit()
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        searchBar.tintColor = UIColor.clear
        searchBar.backgroundColor = UIColor.clear
        searchBar.barStyle = .blackTranslucent
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.white
            textfield.backgroundColor = UIColor.clear
            textfield.font = UIFont.systemFont(ofSize: 12)
        }
        return searchBar
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        print("textSearched: \(textSearched)")
    }
}

```

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ASAppBar is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ASAppBar'
```

## Author

amitpstu1@gmail.com, amitpstu1@gmail.com

## License

ASAppBar is available under the MIT license. See the LICENSE file for more info.
