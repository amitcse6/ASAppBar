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
    
    let leftBarMultiplierH: CGFloat = StaticVariable.leftBarMultiplier
    let leftBarMultiplierV: CGFloat = StaticVariable.leftBarMultiplier
    let rightBarMultiplierH: CGFloat = StaticVariable.rightBarMultiplier
    let rightBarMultiplierV: CGFloat = StaticVariable.rightBarMultiplier
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let titleView = ASAChangableView(StaticVariable.APP_NAME, {self.initTitleLabel()},{self.initTitleLabel()})
        let menuView = ASAChangableView("Menu", {UIImageView(image: UIImage(named: StaticVariable.menu))},{UIImageView(image: UIImage(named: StaticVariable.menu))})
        let moreView = ASAChangableView("More", {UIImageView(image: UIImage(named: StaticVariable.moreIcon))},{UIImageView(image: UIImage(named: StaticVariable.moreIcon))})
        let notificationView = ASAChangableView("Notification", {UIImageView(image: UIImage(named: StaticVariable.notification))},{UIImageView(image: UIImage(named: StaticVariable.notification))})
        let searchView = ASAChangableView("Search", {UIImageView(image: UIImage(named: StaticVariable.search))},{self.initSearchBar()})
        let showMoreProps = ASADropDownProp(UIFont.systemFont(ofSize: 15), UIColor.black, UIColor.lightGray, UIColor.lightGray)
        
        self.appBar
            .setBackgroundColor(UIColor.blue)
            .setLeftView(nil, menuView, ASAMultiplier(leftBarMultiplierH, leftBarMultiplierV), StaticVariable.appBarIconPadding, true, { (appbar, subView, isOn) in print("isOn: \(isOn)") })
            .setLeftView(1, titleView, ASAMultiplier(2, 1), StaticVariable.appBarIconPadding, false, true, { (appbar, subView, isOn) in print("isOn: \(isOn)")})
            .setRightView(nil, moreView, ASAMultiplier(rightBarMultiplierH, rightBarMultiplierV), StaticVariable.appBarIconPadding, true, { (appbar, subView, isOn) in appbar.showMore(subView, showMoreProps.background, showMoreProps, {(index, title) in print("title: \(title)")}); print("isOn: \(isOn)")})
            .setRightView(nil, notificationView, ASAMultiplier(rightBarMultiplierH, rightBarMultiplierV), StaticVariable.appBarIconPadding, true, { (appbar, subView, isOn) in print("isOn: \(isOn)")})
            .setRightView(nil, searchView, ASAMultiplier(rightBarMultiplierH, rightBarMultiplierV), StaticVariable.appBarIconPadding, true, true, { (appbar, subView, isOn) in print("isOn: \(isOn)"); appbar.setMultiplier(1, (isOn ? ASAMultiplier(0, 0) : ASAMultiplier(2, 1))) })
            .setRightView(nil, menuView, ASAMultiplier(rightBarMultiplierH, rightBarMultiplierV), StaticVariable.appBarIconPadding, false, { (appbar, subView, isOn) in print("isOn: \(isOn)")})
            .setRightView(nil, notificationView, ASAMultiplier(rightBarMultiplierH, rightBarMultiplierV), StaticVariable.appBarIconPadding, false, { (appbar, subView, isOn) in print("isOn: \(isOn)")})
            .setRightView(nil, menuView, ASAMultiplier(rightBarMultiplierH, rightBarMultiplierV), StaticVariable.appBarIconPadding, false, { (appbar, subView, isOn) in print("isOn: \(isOn)")})
    }
    
    func initTitleLabel() -> UILabel {
        let label = UILabel()
        label.text = StaticVariable.APP_NAME
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        print("textSearched: \(textSearched)")
    }
}
