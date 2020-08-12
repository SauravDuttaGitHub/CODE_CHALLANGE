//
//  TreadingTableViewCell.swift
//  TheCodeChallange
//
//  Created by appledev2 on 12/08/20.
//  Copyright © 2020 Saurav Dutta. All rights reserved.
//

import UIKit

class TreadingTableViewCell: UITableViewCell {

    let vwTrd : UIView = {
        let vwCat = UIView()
        vwCat.backgroundColor = UIColor.white
        vwCat.layer.borderWidth = 0.1
        return vwCat
    }()
    
    let lblTitle : UILabel = {
        let lblTitle = UILabel()
        lblTitle.textColor = UIKIT_COLOR_SECONDARY
        lblTitle.font = NAV_TITLE_FONT
        lblTitle.textAlignment = .left
        return lblTitle
       }()
    
    let lblSubTitle : UILabel = {
        let lblSubTitle = UILabel()
        lblSubTitle.textColor = UIKIT_COLOR_SECONDARY_II
        lblSubTitle.font = PRIMARY_FONT
        lblSubTitle.textAlignment = .left
        return lblSubTitle
       }()
    
    let lblValueChanged : UILabel = {
        let lblValueChanged = UILabel()
        lblValueChanged.backgroundColor  = #colorLiteral(red: 0.9298957856, green: 0.04705966841, blue: 0.07450980693, alpha: 1)
        lblValueChanged.textColor = UIColor.white
        lblValueChanged.font = PRIMARY_FONT
        lblValueChanged.textAlignment = .center
        lblValueChanged.layer.borderWidth = 0.1
        lblValueChanged.layer.borderColor = UIColor.white.cgColor
        lblValueChanged.layer.cornerRadius = 5.0
        lblValueChanged.layer.masksToBounds = true
        lblValueChanged.text = "-4.48%"
        return lblValueChanged
    }()
    
    let imgIcon : UIImageView = {
        let imgIcon = UIImageView()
        imgIcon.image = UIImage(named: "Market")
        imgIcon.layer.borderWidth = 0.1
        imgIcon.layer.borderColor = UIColor.white.cgColor
        imgIcon.layer.cornerRadius = 30.0
        imgIcon.contentMode = .scaleAspectFill
        imgIcon.tintColor = .white
        imgIcon.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        return imgIcon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = UIColor.systemGroupedBackground
        
        self.vwTrd.addSubview(self.imgIcon)
        self.vwTrd.addSubview(self.lblTitle)
        self.vwTrd.addSubview(self.lblSubTitle)
        self.vwTrd.addSubview(self.lblValueChanged)
        
        self.imgIcon.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(60.0)
            make.width.equalTo(60.0)
            make.leading.equalTo(20.0)
            make.centerY.equalTo(self.vwTrd)
        }
        
        self.lblTitle.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.imgIcon.snp.trailing).offset(10)
            make.top.equalTo(self.vwTrd).offset(20)
            make.height.equalTo(20.0)
        }
        
        self.lblSubTitle.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.imgIcon.snp.trailing).offset(10)
            make.top.equalTo(self.lblTitle.snp.bottom)
            make.height.equalTo(20.0)
        }
        
        self.lblValueChanged.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(80.0)
            make.leading.equalTo(self.lblTitle.snp.trailing).offset(10)
            make.trailing.equalTo(self.vwTrd).inset(10)
            make.height.equalTo(20.0)
            make.centerY.equalTo(self.vwTrd)
        }

        self.addSubview(self.vwTrd)
        self.vwTrd.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.contentView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
            make.height.equalTo(90)

        }
        self.contentView.snp.makeConstraints { (consMaker) -> Void in
            consMaker.edges.equalTo(self)

        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("fatal error:")
    }

}
