//
//  Master.swift
//  TheCodeChallange
//
//  Created by appledev2 on 11/08/20.
//  Copyright © 2020 Saurav Dutta. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Navigation Controller Master
class SDNavController: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        self.navigationBar.isTranslucent = true
        self.navigationBar.tintColor = UIKIT_COLOR_SECONDARY
        self.navigationBar.barTintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: NAV_TITLE_FONT, NSAttributedString.Key.foregroundColor:UIKIT_COLOR_SECONDARY]
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - UIViewController Extension
class SDViewController : UIViewController {
    
    convenience init(title: String) {
        self.init(title:title,leftBarImageNamed:"Menu",rightBarImageNamed:"Notification")
        self.view.backgroundColor = .white
     
    }
    init(title: String,leftBarImageNamed:String,rightBarImageNamed:String) {
        super.init(nibName: nil, bundle: nil)
        self.navigationItem.title = title
        
        if leftBarImageNamed != ""{
            let leftBtn = UIBarButtonItem(image: UIImage(named: "Menu"),
                                      style: UIBarButtonItem.Style.plain ,
                                      target: self, action: #selector(self.OnLeftClicked))
            self.navigationItem.leftBarButtonItem = leftBtn
        }
        
        if rightBarImageNamed != ""{
            let rightBtn = UIBarButtonItem(image: UIImage(named: "Notification"),
                                      style: UIBarButtonItem.Style.plain ,
                                      target: self, action: #selector(self.OnRightClicked))
            self.navigationItem.rightBarButtonItem = rightBtn
        }
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bar Button Action
    @objc func OnLeftClicked(){
    }
    
    @objc func OnRightClicked(){
    }
    
}
