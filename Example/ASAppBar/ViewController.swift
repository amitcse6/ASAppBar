//
//  ViewController.swift
//  ASAppBar
//
//  Created by amitpstu1@gmail.com on 09/03/2020.
//  Copyright (c) 2020 amitpstu1@gmail.com. All rights reserved.
//

import UIKit
import ASAppBar

class ViewController: UIViewController {
    @IBOutlet weak var appBar: ASAppBarClassic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boxPadding = CGSize(width: 10, height: 0)
        let multiplier = ASAMultiplier(0.6, 0.6)
        let titleMultiplier = ASAMultiplier(2.0, 0.6)
        let iconPadding = CGSize(width: 5, height: 5)
        let searchIconPadding = CGSize(width: 5, height: 5)
        
        
        let title = ASAChangableView("App Name", {self.initTitleLabel("App Name 1")}, {self.initTitleLabel("App Name 2")}, ASAProps(titleMultiplier, iconPadding), ASAProps(titleMultiplier, iconPadding))
        
        let menu = ASAChangableView("Menu", {UIImageView(image: UIImage(named: "menu"))}, {UIImageView(image: UIImage(named: "moreIcon"))}, ASAProps(multiplier, iconPadding), ASAProps(multiplier, iconPadding))
        
        let more = ASAChangableView("More", {UIImageView(image: UIImage(named: "moreIcon"))}, {UIImageView(image: UIImage(named: "moreIcon"))}, ASAProps(multiplier, iconPadding), ASAProps(multiplier, iconPadding))
        
        let notifi = ASAChangableView("Notification", {UIImageView(image: UIImage(named: "notification"))},{UIImageView(image: UIImage(named: "notification"))}, ASAProps(multiplier, iconPadding), ASAProps(multiplier, iconPadding))
        
        let search = ASAChangableView("Search", {UIImageView(image: UIImage(named: "search"))}, {self.initSearchBar()}, ASAProps(multiplier, iconPadding), ASAProps(multiplier, searchIconPadding))
        
        let showMoreProps = ASADropDownProp(UIFont.systemFont(ofSize: 15), UIColor.black, UIColor.lightGray, UIColor.lightGray)
        
        self.appBar
            .setBackgroundColorAll(UIColor.blue)
            .setBoxPadding(boxPadding)
            .setSideView("0", menu, true, false, false, .left, { (appbar, subView, isOn) in print("\(isOn)") })
            .setSideView("1", title, true, false, false, .left, { (appbar, subView, isOn) in print("\(isOn)")})
            .setSideView("2", more, true, false, false, .right, { (appbar, subView, isOn) in appbar.showMore(subView, showMoreProps.background, showMoreProps, {(index, title) in print("title: \(title)")}); print("\(isOn)")})
            .setSideView("3", notifi, true, false, false, .right, { (appbar, subView, isOn) in print("\(isOn)")})
            .setSideView("4", search, true, false, true, .right, { (appbar, subView, isOn) in print("\(isOn)"); appbar.setMultiplier("1", (isOn ? ASAMultiplier.zero : appbar.getASAView("1")?.props?.multiplier)) })
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
