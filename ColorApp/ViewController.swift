//
//  ViewController.swift
//  ColorApp
//
//  Created by 大島秀顕 on 2017/03/03.
//  Copyright © 2017年 hideaki oshima. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomViewDelegate {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.frame.size = CGSize(width: 100, height: 100)
        button.center.x = self.view.center.x
        button.center.y = self.view.center.y
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(self.tapButton(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapButton(sender: UIButton) {
        showCutomView()
    }
    
    func showCutomView() {
        let colorView = CustomView(frame: self.view.frame)
        colorView.customDelegate = self
        self.view.addSubview(colorView)
    }
    
    func modal(color: UIColor) {
        button.backgroundColor = color
    }
}

