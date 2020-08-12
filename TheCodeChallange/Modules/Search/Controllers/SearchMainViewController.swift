//
//  SearchMainViewController.swift
//  TheCodeChallange
//
//  Created by Saurav Dutta on 11/08/20.
//  Copyright © 2020 Saurav Dutta. All rights reserved.
//

import UIKit
import Parchment
import SnapKit

class SearchMainViewController: SDViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addParchemnt()
    }
    
    // MARK: - Parchment Addition
    func addParchemnt(){
        
        let viewControllers = [
            SearchContentViewController(title:"Category",index:0),
            SearchContentViewController(title:"Themes",index:1),
            SearchContentViewController(title:"Trending",index:2)
        ]
                            
        let pagingViewController = PagingViewController(viewControllers: viewControllers)
        pagingViewController.font = PRIMARY_FONT
        pagingViewController.textColor = UIKIT_COLOR_SECONDARY
        pagingViewController.borderColor = UIColor.clear
              
        pagingViewController.indicatorColor = APP_PRIMARY_COLOR
        pagingViewController.selectedTextColor = APP_PRIMARY_COLOR
        pagingViewController.selectedFont = PRIMARY_FONT
              
        // Make sure you add the PagingViewController as a child view
        // controller and constrain it to the edges of the view.
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
              
        pagingViewController.view.snp.makeConstraints { (make) in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0))
        }
              
        pagingViewController.didMove(toParent: self)
    }
    
}
