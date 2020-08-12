//
//  CategoryTableViewCell.swift
//  TheCodeChallange
//
//  Created by appledev2 on 12/08/20.
//  Copyright © 2020 Saurav Dutta. All rights reserved.
//

import UIKit
import SnapKit
class CategoryTableViewCell: UITableViewCell {
    
    let vwCat : UIView = {
        let vwCat = UIView()
        vwCat.backgroundColor = UIColor.white
        vwCat.layer.borderWidth = 0.1
        vwCat.layer.borderColor = .none
        vwCat.layer.cornerRadius = 40.0
        vwCat.layer.shadowOpacity = 0.1
        return vwCat
    }()

    let lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        lbl.font = HIGHLIGHTED_FONT
        lbl.textAlignment = .left
        lbl.text = "Stock"
        return lbl
       }()

    let imgIcon : UIImageView = {
        let imgIcon = UIImageView()
        imgIcon.image = UIImage(named: "Research")
        imgIcon.layer.borderWidth = 5.0
        imgIcon.layer.borderColor = UIColor.white.cgColor
        imgIcon.layer.cornerRadius = 30.0
        imgIcon.contentMode = .scaleAspectFill
        imgIcon.tintColor = .white
        return imgIcon
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = UIColor.white
        
        self.vwCat.addSubview(self.lblTitle)
        self.vwCat.addSubview(self.imgIcon)
        
        self.imgIcon.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(60.0)
            make.width.equalTo(60.0)
            make.leading.equalTo(20.0)
            make.centerY.equalTo(self.vwCat)
        }
        
        self.lblTitle.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(40.0)
            make.trailing.equalTo(self.vwCat).inset(10)
            make.leading.equalTo(self.imgIcon.snp.trailing).offset(10.0)
            make.centerY.equalTo(self.vwCat)
        }
        
        self.addSubview(self.vwCat)
      
        self.vwCat.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.contentView).inset(UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
            make.height.equalTo(80.0)

        }
        
        self.contentView.snp.makeConstraints { (consMaker) -> Void in
            consMaker.edges.equalTo(self)

        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("fatal error:")
    }

}
