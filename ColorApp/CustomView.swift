//
//  CustomView.swift
//  ColorApp
//
//  Created by 大島秀顕 on 2017/03/03.
//  Copyright © 2017年 hideaki oshima. All rights reserved.
//

import UIKit

class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeBackgroundView(viewController: UIViewController) -> UIView {
        let backgroundView = UIView()
        backgroundView.frame = CGRect(x: 0, y: 0, width: viewController.view.frame.width, height: viewController.view.frame.height)
//        これだとエラーでた。。
//        backgroundView.backgroundColor = UIColor(red: 139, green: 139, blue: 139, alpha: 0.6)
        backgroundView.backgroundColor = UIColor.gray
        return backgroundView
    }
    
    func makeColorSelectView(bgView: UIView) -> UIView {
        let colorSelectView = UIView()
        colorSelectView.frame = CGRect(x: Int(bgView.frame.width / 6), y: 50, width: Int(bgView.frame.width / 6 * 4), height: Int(bgView.frame.height - 100))
        colorSelectView.backgroundColor = UIColor.white
        return colorSelectView
    }
    
    func makeColorCell(colorSelectView: UIView, color: String, x: CGFloat, y: CGFloat) -> UIView {
        let colorCell = UIButton()
        colorCell.backgroundColor = UIColor.UIcolor(color)
        colorCell.frame = CGRect(x: x, y: y, width: colorSelectView.frame.width - 10, height: colorSelectView.frame.height / 9)
        return colorCell
    }
}
