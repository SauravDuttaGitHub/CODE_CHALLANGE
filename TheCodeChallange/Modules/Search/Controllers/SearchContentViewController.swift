//
//  SearchContentViewController.swift
//  TheCodeChallange
//
//  Created by appledev2 on 12/08/20.
//  Copyright © 2020 Saurav Dutta. All rights reserved.
//

import UIKit
import SnapKit

final class SearchContentViewController: UIViewController {

    lazy var tblView = UITableView() //TableView used.
    lazy var colView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()) //TableView used.
    var index = 0
    
    convenience init(title: String,index:Int) {
        self.init(title: title)
        self.index = index
    }
      
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.view.backgroundColor = .systemGroupedBackground
        
        if title == "Themes"{
            
            self.view.addSubview(colView)
            self.colView.snp.makeConstraints { (make) in
                    make.edges.equalTo(view).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
            }
            self.setUpCollectionView()
            
        }else{
            
           self.view.addSubview(tblView)
           self.tblView.snp.makeConstraints { (make) in
                make.edges.equalTo(view).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
            }
            self.setUpTableView()
        }
    }
    
    // MARK: - TableView Design and Layout
    func setUpTableView(){
        self.tblView.backgroundColor = .clear
        self.tblView.separatorStyle = .none
        self.tblView.allowsSelection = false
        
        self.tblView.delegate = self
        self.tblView.dataSource = self
        
        //Registering Cells
        self.tblView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "CategoryTableViewCell")
        self.tblView.register(TreadingTableViewCell.self, forCellReuseIdentifier: "TreadingTableViewCell")
    }
    
    // MARK: - CollectionVIew Design and Layout
    func setUpCollectionView(){
        self.colView.backgroundColor = .clear
        self.colView.allowsSelection = false

        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsets(top: 10.0, left:10.0, bottom: 10.0, right: 10.0)
        flow.minimumInteritemSpacing = 10.0
        flow.minimumLineSpacing = 10.0

        // Apply flow layout
        self.colView.setCollectionViewLayout(flow, animated: false)
        self.colView.delegate = self
        self.colView.dataSource = self
        
        //Registering Cells
        self.colView.register(ThemesCollectionViewCell.self, forCellWithReuseIdentifier: "ThemesCollectionViewCell")
    }
      
      required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }
}
    // MARK: - Extension Declares TableView DataSource and Delegate
    // In-Short :This extension is responsible to call datasource methods of UITableView.
    // Added by: Saurav Dutta
    // Added on: 11/08/20

extension SearchContentViewController: UITableViewDataSource,UITableViewDelegate {
    
    // To specify total number of sections to be generate.
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.index == 0{
            return 1
        }else{
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if self.index == 2 {
            return 40.0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if self.index == 2 {
            if section == 0{
                return "Top Gainers"
            }else{
                return "Top Loosers"
            }
        }
         return ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.index == 2{
            if section == 0{
                return 4
            }else{
                return 2
            }
        }
        return 3
    }
    
    // To dynamically set height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if self.index == 0{
            return 100.0
        }else if self.index == 2{
            return 80.0
        }
        return 0.0
    }
    
    // To specify the cell in each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.index == 0{
            var cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell
                if (cell == nil) {
                    cell = CategoryTableViewCell.init(style: .default, reuseIdentifier: "CategoryTableViewCell")
                }
        
            if indexPath.row == 0{
                cell?.vwCat.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
                cell?.lblTitle.text = "Stock"
            }else if indexPath.row == 1{
                cell?.vwCat.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
                cell?.lblTitle.text = "ETFs"
            }else{
                cell?.vwCat.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
                cell?.lblTitle.text = "Crypto"
            }
            return cell!
        }
        else if self.index == 2{
            var cell = tableView.dequeueReusableCell(withIdentifier: "TreadingTableViewCell", for: indexPath) as? TreadingTableViewCell
                 if (cell == nil) {
                     cell = TreadingTableViewCell.init(style: .default, reuseIdentifier: "TreadingTableViewCell")
                 }
                 
            if indexPath.section == 0{
                
                 if indexPath.row == 0{
                     cell?.lblTitle.text = "Medifest"
                     cell?.lblSubTitle.text = "MEDI"
                 }else if indexPath.row == 1{
                    cell?.lblTitle.text = "Pinterest"
                    cell?.lblSubTitle.text = "PINS"
                 }else if indexPath.row == 2{
                    cell?.lblTitle.text = "Slack Technologies"
                    cell?.lblSubTitle.text = "SLK"
                 }else{
                    cell?.lblTitle.text = "Evokua Water"
                    cell?.lblSubTitle.text = "EVO"
                }
                
            }else{
                
                if indexPath.row == 0{
                     cell?.lblTitle.text = "Medifest"
                     cell?.lblSubTitle.text = "MEDI"
                 }else{
                    cell?.lblTitle.text = "Evokua Water"
                    cell?.lblSubTitle.text = "EVO"
                }
                
            }
            return cell!
        }
        
        return UITableViewCell()
    }
}

// MARK: - Extension Declares Collection View DataSource and Delegate
// In-Short :This extension is responsible to call datasource methods of UITableView.
// Added by: Saurav Dutta
// Added on: 11/08/20
extension SearchContentViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
        func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
        }
       
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 11
       }
       
        func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
            return 10
        }
    
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: (UIScreen.main.bounds.size.width-30)/2, height: (UIScreen.main.bounds.size.width-30)/2)
        
       }
    
       func collectionView(_ collectionView: UICollectionView, layoucollectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
       }
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ThemesCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "ThemesCollectionViewCell", for: indexPath as IndexPath) as? ThemesCollectionViewCell)!
        return cell
        
      }
}
