//
//  ViewController.swift
//  SSAlertView-Swift
//
//  Created by haohao on 16/8/8.
//  Copyright © 2016年 haohao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var alertView : SSAlertView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func topClick(sender: AnyObject) {
        self.alertView = SSAlertView.init(title: "温馨提示", message: "请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意", cancelButtonTitle: "取消", otherButtonTitles: ["按钮1", "按钮2"])
        self.alertView?.mode = .Success
        self.alertView?.leaveMode = .Top
        self.alertView?.clickIndex = {(index: NSInteger) in
            print("您点击的按钮下标是\(index)")
        }
        self.alertView?.show()
    }

    @IBAction func rightClick(sender: AnyObject) {
        self.alertView = SSAlertView.init(title: "温馨提示", message: "请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意", cancelButtonTitle: "取消", otherButtonTitles: ["按钮1"])
        self.alertView?.mode = .Warning
        self.alertView?.leaveMode = .Right
        self.alertView?.clickIndex = {(index: NSInteger) in
            print("您点击的按钮下标是\(index)")
        }
        self.alertView?.show()
    }
    
    
    @IBOutlet weak var bottomClick: UIButton!
    
    @IBAction func bottomClick(sender: AnyObject) {
        self.alertView = SSAlertView.init(title: "温馨提示", message: "请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意", cancelButtonTitle: "取消", otherButtonTitles: nil)
        self.alertView?.mode = .Error
        self.alertView?.leaveMode = .Bottom
        self.alertView?.clickIndex = {(index: NSInteger) in
            print("您点击的按钮下标是\(index)")
        }
        self.alertView?.show()
    }
    
    @IBAction func leftClick(sender: AnyObject) {
        self.alertView = SSAlertView.init(title: "温馨提示", message: "请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意", cancelButtonTitle: nil, otherButtonTitles: ["按钮1", "按钮2"])
        self.alertView?.mode = .Success
        self.alertView?.leaveMode = .Left
        self.alertView?.clickIndex = {(index: NSInteger) in
            print("您点击的按钮下标是\(index)")
        }
        self.alertView?.show()
    }
    

    @IBAction func defaultClick(sender: AnyObject) {
        self.alertView = SSAlertView.init(title: "温馨提示", message: "请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意", cancelButtonTitle: "取消", otherButtonTitles: ["按钮1", "按钮2", "按钮3"])
        self.alertView?.mode = .Success
        self.alertView?.clickIndex = {(index: NSInteger) in
            print("您点击的按钮下标是\(index)")
        }
        self.alertView?.show()
    }
}

