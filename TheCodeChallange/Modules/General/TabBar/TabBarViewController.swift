//
//  TabBarViewController.swift
//  TheCodeChallange
//
//  Created by Saurav Dutta on 11/08/20.
//  Copyright © 2020 Saurav Dutta. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = self.setAllViewControllers()
        self.setLayoutAndDesign()
    }
    
    // MARK: - Set VCs to TabBar
    //In-Short :This method returns all VC associated with the Tab Bar.
    // Added by: Saurav Dutta
    // Added on: 11/08/20
     func setAllViewControllers() ->[UIViewController]{
        let vcHome = setVcForTabBar(SDViewController(title: "Home"),"Home")
        let vcSearch = setVcForTabBar(SearchMainViewController(title: "Search"),"Search")
        let vcMarket = setVcForTabBar(SDViewController(title: "Market"),"Market")
        let vcUsers =  setVcForTabBar(SDViewController(title: "Users"),"Users")
        let vcReserach = setVcForTabBar(SDViewController(title: "Research"),"Research")
        return [vcHome,vcSearch,vcMarket,vcUsers,vcReserach]
    }
    
    func setVcForTabBar(_ vc:UIViewController,_ imgNamed:String = "") -> UIViewController{
        let vc = SDNavController(rootViewController: vc)
        vc.view.backgroundColor = UIColor.white
        vc.tabBarItem = UITabBarItem(title: "", image: UIImage(named: imgNamed), selectedImage: UIImage(named: imgNamed))
        return vc
    }
    
    // MARK: - Design & Appearance
    // In-Short :These methods are responsible to setup the design and appearance of this Tab Bar by setting up colors.
    // Added by: Saurav Dutta
    // Added on: 11/08/20
    func setLayoutAndDesign(){
        self.tabBar.barTintColor = UIColor.white
        self.tabBar.tintColor = APP_PRIMARY_COLOR
    }
}
