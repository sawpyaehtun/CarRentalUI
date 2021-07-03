//
//  MainTabbarController.swift
//  iOSUITest
//
//  Created by Tamron iMac 001 on 7/3/21.
//

import UIKit

class MainTabbarController:  UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setUpUI()
    }
    
    func setUpUI() {
        
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.3960784314, green: 0.4392156863, blue: 0.568627451, alpha: 1)
        tabBar.tintColor = .white
        tabBar.barTintColor = #colorLiteral(red: 0.01960784314, green: 0.09803921569, blue: 0.3058823529, alpha: 1)
        
        let rentCarVC = RentCarViewController.init()
        let rentCarNav = UINavigationController.init(rootViewController: rentCarVC)
        
        let bookingVC = BookingViewController.init()
        let bookingNav = UINavigationController(rootViewController: bookingVC)
        
        let referVC = ReferViewController.init()
        let referNav = UINavigationController(rootViewController: referVC)

        let accountVC = AccountViewController.init()
        let accountNav = UINavigationController(rootViewController: accountVC)
        
        
        /* Create TabBar items */
        
        let rentCarItem = UITabBarItem(title: "Rent a car", image: UIImage(named: "car"), tag: 0)
        rentCarItem.imageInsets = UIEdgeInsets(top: -6, left: 0, bottom: 0, right: 0)
        let bookingItem = UITabBarItem(title: "Booking", image: UIImage(named: "car"), tag: 1)
        bookingItem.imageInsets = UIEdgeInsets(top: -6, left: 0, bottom: 0, right: 0)
        let referItem = UITabBarItem(title: "Refer a friend", image: UIImage(named: "car"), tag: 2)
        referItem.imageInsets = UIEdgeInsets(top: -6, left: 0, bottom: 0, right: 0)
        let accountItem = UITabBarItem(title: "account", image: UIImage(named: "car"), tag: 3)
        accountItem.imageInsets = UIEdgeInsets(top: -6, left: 0, bottom: 0, right: 0)
        
      
        rentCarNav.tabBarItem = rentCarItem
        bookingNav.tabBarItem = bookingItem
        referNav.tabBarItem = referItem
        accountNav.tabBarItem = accountItem
            
        let tabBarList = [
            rentCarNav ,
            bookingNav,
            referNav ,
            accountNav
        ]
        
        /* Adding ViewControllers to TabBarViewController */
        viewControllers = tabBarList
        
        
    }
}
