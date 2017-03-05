//
//  ViewController.swift
//  ColorApp
//
//  Created by 大島秀顕 on 2017/03/03.
//  Copyright © 2017年 hideaki oshima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var colorView = CustomView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(colorView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapButton(_ sender: UIButton) {
        let backgroundView = colorView.makeBackgroundView(viewController: self)
        self.view.addSubview(backgroundView)
        let colorSelectView = colorView.makeColorSelectView(bgView: backgroundView)
        backgroundView.addSubview(colorSelectView)
        for i in 1...9 {
            var colors = ["red", "blue", "black", "green", "cyan", "yellow", "magenta","purple", "orange"]
            let colorCell = colorView.makeColorCell(colorSelectView: colorSelectView, color: colors[i], x: 5, y: 5)
            colorSelectView.addSubview(colorCell)
        }
    }

}

