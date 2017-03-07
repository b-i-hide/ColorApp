//
//  CustomView.swift
//  ColorApp
//
//  Created by 大島秀顕 on 2017/03/03.
//  Copyright © 2017年 hideaki oshima. All rights reserved.
//

import UIKit

protocol CustomViewDelegate {
    func modal(color:UIColor)
}

class CustomView: UIView {
    
    var customDelegate:CustomViewDelegate?
    let backgroundView = UIView()
    let colorSelectView = UIView()
    var colors: [UIColor] = [UIColor.red, UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.green, UIColor.orange, UIColor.purple, UIColor.black, UIColor.yellow]
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeBackgroundView()
        makeColorSelectView()
        for i in 0...8 {
            let blankSpace = CGFloat(5*(i+1))
            let cellHeight = Int((colorSelectView.frame.height - 50) / 9)
            let cellPositionY: CGFloat = CGFloat(cellHeight * i)
            makeColorCell(color: colors[i], y: blankSpace + cellPositionY)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeBackgroundView() {
        backgroundView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        self.addSubview(backgroundView)
    }
    
    func makeColorSelectView() {
        colorSelectView.frame = CGRect(x: Int(backgroundView.frame.width / 6), y: 50, width: Int(backgroundView.frame.width / 6 * 4), height: 500)
        colorSelectView.backgroundColor = UIColor.white
        backgroundView.addSubview(colorSelectView)
    }
    
    func makeColorCell(color: UIColor, y: CGFloat){
        let colorCell = UIButton()
        colorCell.backgroundColor = color
        colorCell.frame = CGRect(x: 5, y: y, width: colorSelectView.frame.width - 10, height: (colorSelectView.frame.height - 50) / 9)
        colorCell.addTarget(self, action: #selector(self.tapColorCell(sender:)), for: UIControlEvents.touchUpInside)
        colorSelectView.addSubview(colorCell)
    }
    
    func tapColorCell(sender: UIButton) {
        customDelegate?.modal(color: sender.backgroundColor!)
        self.removeFromSuperview()
    }
}
