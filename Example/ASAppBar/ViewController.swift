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
        
        let appBarIconPadding = CGSize(width: 10, height: 10)
        let leftBarMultiplierH: CGFloat = 0.6
        let leftBarMultiplierV: CGFloat = 0.6
        let rightBarMultiplierH: CGFloat = 0.6
        let rightBarMultiplierV: CGFloat = 0.6
        
        let titleView = ASAChangableView("App Name", {self.initTitleLabel()},{self.initTitleLabel()})
        let menuView = ASAChangableView("Menu", {UIImageView(image: UIImage(named: "menu"))},{UIImageView(image: UIImage(named: "menu"))})
        let moreView = ASAChangableView("More", {UIImageView(image: UIImage(named: "moreIcon"))},{UIImageView(image: UIImage(named: "moreIcon"))})
        let notificationView = ASAChangableView("Notification", {UIImageView(image: UIImage(named: "notification"))},{UIImageView(image: UIImage(named: "notification"))})
        let searchView = ASAChangableView("Search", {UIImageView(image: UIImage(named: "search"))},{self.initSearchBar()})
        let showMoreProps = ASADropDownProp(UIFont.systemFont(ofSize: 15), UIColor.black, UIColor.lightGray, UIColor.lightGray)
        
        self.appBar
            .setBackgroundColor(UIColor.blue)
            .setLeftView(0, menuView, ASAMultiplier(leftBarMultiplierH, leftBarMultiplierV), appBarIconPadding, true, { (appbar, subView, isOn) in print("isOn: \(isOn)") })
            .setLeftView(1, titleView, ASAMultiplier(2, 1), appBarIconPadding, false, true, { (appbar, subView, isOn) in print("isOn: \(isOn)")})
            .setRightView(2, moreView, ASAMultiplier(rightBarMultiplierH, rightBarMultiplierV), appBarIconPadding, true, { (appbar, subView, isOn) in appbar.showMore(subView, showMoreProps.background, showMoreProps, {(index, title) in print("title: \(title)")}); print("isOn: \(isOn)")})
            .setRightView(3, notificationView, ASAMultiplier(rightBarMultiplierH, rightBarMultiplierV), appBarIconPadding, true, { (appbar, subView, isOn) in print("isOn: \(isOn)")})
            .setRightView(4, searchView, ASAMultiplier(rightBarMultiplierH, rightBarMultiplierV), appBarIconPadding, true, true, { (appbar, subView, isOn) in print("isOn: \(isOn)"); appbar.setMultiplier(1, (isOn ? ASAMultiplier(0, 0) : ASAMultiplier(2, 1))) })
            .setRightView(5, menuView, ASAMultiplier(rightBarMultiplierH, rightBarMultiplierV), appBarIconPadding, false, { (appbar, subView, isOn) in print("isOn: \(isOn)")})
            .setRightView(6, notificationView, ASAMultiplier(rightBarMultiplierH, rightBarMultiplierV), appBarIconPadding, false, { (appbar, subView, isOn) in print("isOn: \(isOn)")})
            .setRightView(7, menuView, ASAMultiplier(rightBarMultiplierH, rightBarMultiplierV), appBarIconPadding, false, { (appbar, subView, isOn) in print("isOn: \(isOn)")})
    }
    
    func initTitleLabel() -> UILabel {
        let label = UILabel()
        label.text = "App Name"
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
        }
        return searchBar
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        print("textSearched: \(textSearched)")
    }
}
