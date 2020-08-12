//
//  ThemesCollectionViewCell.swift
//  TheCodeChallange
//
//  Created by appledev2 on 12/08/20.
//  Copyright © 2020 Saurav Dutta. All rights reserved.
//

import UIKit

class ThemesCollectionViewCell: UICollectionViewCell {
    let vwTheme : UIView = {
        let vwTheme = UIView()
        vwTheme.backgroundColor = UIColor.white
        vwTheme.layer.borderWidth = 0.1
        vwTheme.layer.borderColor = .none
        vwTheme.layer.cornerRadius = 40.0
        vwTheme.layer.shadowOpacity = 0.1
        return vwTheme
    }()

    let lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIKIT_COLOR_PRIMARY
        lbl.font = NAV_TITLE_FONT
        lbl.textAlignment = .center
        lbl.text = "Aet & Fassion"
        lbl.minimumScaleFactor = 0.5
        return lbl
       }()

    let imgIcon : UIImageView = {
        let imgIcon = UIImageView()
        imgIcon.image = UIImage(named: "Home")
        imgIcon.layer.borderWidth = 0.1
        imgIcon.layer.borderColor = UIColor.white.cgColor
        imgIcon.layer.cornerRadius = 30.0
        imgIcon.contentMode = .scaleAspectFill
        imgIcon.tintColor = .white
        imgIcon.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        return imgIcon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.vwTheme.addSubview(self.lblTitle)
        self.vwTheme.addSubview(self.imgIcon)
        
        self.imgIcon.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(60.0)
            make.width.equalTo(60.0)
            make.centerX.equalTo(self.vwTheme)
            make.centerY.equalTo(self.vwTheme)

        }
        self.lblTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.imgIcon.snp.bottom).offset(5)
            make.height.equalTo(20.0)
            make.centerX.equalTo(self.vwTheme)
        }
        
        self.addSubview(self.vwTheme)
        
        self.vwTheme.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.contentView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        self.contentView.snp.makeConstraints { (consMaker) -> Void in
            consMaker.edges.equalTo(self)

        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("fatal error:")
    }
}
