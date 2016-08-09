//
//  SSAlertView.swift
//  SSAlertView-Swift
//
//  Created by haohao on 16/8/8.
//  Copyright © 2016年 haohao. All rights reserved.
//

import UIKit
import SnapKit
typealias ClickIndexClosure = (clickIndex: NSInteger) -> Void
class SSAlertView: UIView {
    
    enum SSAlertViewMode: NSInteger {
        case Success = 1//正确
        case Error      //错误
        case Warning    //警告
        case Default    //默认
    }
    
    enum SSAlertViewLeaveMode: NSInteger {
        case Default = 1 //默认
        case Top         //上
        case Bottom      //下
        case Left        //左
        case Right       //右
    }
    
    var titleString = String?()
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFontOfSize(20)
        titleLabel.textAlignment = .Center
        titleLabel.textColor = UIColor.blackColor()
        return titleLabel
    }()
    
    var messageString = String?()
    private lazy var messageLabel:UILabel = {
        let messageLabel = UILabel()
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .Center
        messageLabel.textColor = UIColor.grayColor()
        messageLabel.font = UIFont.systemFontOfSize(14)
        return messageLabel
    }()
    
    var cancelString = String?()
    var cancelButton : UIButton?
    var otherButtonString = Array<String>()
    
    private lazy var logoView: UIView = {
        let logoView = UIView()
        return logoView
    }()
    
    private lazy var backView: UIView = {
        let backView = UIView.init(frame: UIScreen.mainScreen().bounds)
        backView.backgroundColor = UIColor.blackColor()
        backView.alpha = 0.2
        return backView
    }()
    
    private lazy var alertView: UIView = {
        let alertView = UIView()
        alertView.backgroundColor = UIColor.whiteColor()
        alertView.layer.cornerRadius = 5
        return alertView
    }()
    
    var buttonArray = Array<UIButton>()
    var radious = CGFloat()
    var _mode : SSAlertViewMode?
    var mode : SSAlertViewMode? {
        set {
            _mode = newValue
            self.updateModeStyle()
        }
        get {
            return _mode
        }
    }
    private var myContext = 0
    var leaveMode = SSAlertViewLeaveMode?()
    var clickIndex = ClickIndexClosure?()
    
    var alertViewCenterYConstain : Constraint?
    
    
    init(title: String,message: String, cancelButtonTitle: String?, otherButtonTitles: Array<String>?) {
        super.init(frame: UIScreen.mainScreen().bounds)
        self.radious = 5
        self._mode = .Default
        self.leaveMode = .Default
        self.titleString = title
        self.messageString = message
        self.cancelString = cancelButtonTitle
        if otherButtonTitles?.count > 0 {
            self.otherButtonString = otherButtonTitles!
        }
        self.creatUI()
    }
    
    func creatUI() {
        self.titleLabel.text = self.titleString
        self.messageLabel.text = self.messageString
        self.addSubview(self.backView)
        self.addSubview(self.alertView)
        self.alertView.addSubview(self.logoView)
        self.alertView.addSubview(self.titleLabel)
        self.alertView.addSubview(self.messageLabel)
        //下面进行布置button
        self.creatButtons()
        self.updateModeStyle()
        self.setLayout()
    }
    
    func creatButtons() {
        if self.cancelString?.characters.count != nil {
            self.cancelButton = UIButton()
            self.cancelButton?.setTitle(self.cancelString, forState: .Normal)
            self.cancelButton?.tag = 999
            self.cancelButton?.addTarget(self, action: #selector(SSAlertView.btnClick(_:)), forControlEvents: .TouchUpInside)
            self.cancelButton?.layer.cornerRadius = 4
            self.cancelButton?.layer.borderWidth = 1.0
            self.alertView.addSubview(self.cancelButton!)
        }
        if self.otherButtonString.count != 0 {
            for (index, str) in self.otherButtonString.enumerate() {
                let btn  = UIButton()
                btn.setTitle(str, forState: .Normal)
                btn.layer.cornerRadius = 4
                if self.cancelString?.characters.count != 0 {
                    btn.tag = 999 + index + 1
                }else{
                    btn.tag = 999 + index
                }
                btn.addTarget(self, action: #selector(SSAlertView.btnClick(_:)), forControlEvents: .TouchUpInside)
                self.alertView.addSubview(btn)
                self.buttonArray.append(btn)
            }
        }
    }
    
    func btnClick(sender: UIButton) {
        if self.clickIndex != nil {
            self.clickIndex!(clickIndex: sender.tag - 999)
        }
        self.hide()
    }
    
    func hide() {
        let interVal : NSTimeInterval = 0.3
        switch self.leaveMode! {
        case .Bottom:
            UIView.animateWithDuration(interVal, delay: 0, options: .CurveLinear, animations: {
                self.alertView.snp_remakeConstraints(closure: { (make) in
                    make.centerX.equalTo(self.backView)
                    make.left.equalTo(self.backView.snp_left).offset(30)
                    make.right.equalTo(self.backView.snp_right).offset(-30)
                    make.top.equalTo(self.backView.snp_bottom)
                })
                self.layoutIfNeeded()
                }, completion: { (finished) in
                    self.removeFromSuperview()
            })
        case .Top:
        self.alertViewCenterYConstain?.uninstall()
            UIView.animateWithDuration(interVal, delay: 0, options: .CurveLinear, animations: {
                self.alertView.snp_remakeConstraints(closure: { (make) in
                    make.centerX.equalTo(self.backView)
                    make.left.equalTo(self.backView.snp_left).offset(30)
                    make.right.equalTo(self.backView.snp_right).offset(-30)
                    make.bottom.equalTo(self.backView.snp_top)
                })
                self.layoutIfNeeded()
                }, completion: { (finished) in
                    self.removeFromSuperview()
            })
        case .Right:
            UIView.animateWithDuration(interVal, delay: 0, options: .CurveLinear, animations: {
                self.alertView.snp_remakeConstraints(closure: { (make) in
                    make.centerY.equalTo(self.backView)
                    make.left.equalTo(self.backView.snp_right)
                    make.width.equalTo(UIScreen.mainScreen().bounds.size.width - 60)
                })
                self.layoutIfNeeded()
                }, completion: { (finished) in
                    self.removeFromSuperview()
            })
        case .Left:
            UIView.animateWithDuration(interVal, delay: 0, options: .CurveLinear, animations: {
                self.alertView.snp_remakeConstraints(closure: { (make) in
                    make.centerY.equalTo(self.backView)
                    make.right.equalTo(self.backView.snp_left)
                    make.width.equalTo(UIScreen.mainScreen().bounds.size.width - 60)
                })
                self.layoutIfNeeded()
                }, completion: { (finished) in
                    self.removeFromSuperview()
            })
        default:
            self.removeFromSuperview()
        }
        
    }
    
    func show() {
        UIApplication.sharedApplication().windows[0].addSubview(self)
    }
    
    func setLayout() {
        self.alertView.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.backView)
            self.alertViewCenterYConstain = make.centerY.equalTo(self.backView).constraint
            make.left.equalTo(self.backView.snp_left).offset(30)
            make.right.equalTo(self.backView.snp_right).offset(-30)
        }
        
        self.logoView.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.alertView)
            make.top.equalTo(self.alertView.snp_top).offset(10)
            make.size.equalTo(CGSizeMake(drawRectImageWith, drawRectImageWith))
        }
        
        self.titleLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.alertView)
            make.top.equalTo(self.logoView.snp_bottom).offset(10)
            make.left.equalTo(self.alertView.snp_left).offset(10)
            make.right.equalTo(self.alertView.snp_right).offset(-10)
        }
        
        self.messageLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.alertView)
            make.top.equalTo(self.titleLabel.snp_bottom).offset(10)
            make.left.equalTo(self.alertView.snp_left).offset(10)
            make.right.equalTo(self.alertView.snp_right).offset(-10)
        }

        //如果有取消按钮，且其他按钮只有一个的时候
        if self.cancelString?.characters.count != nil && self.otherButtonString.count == 1{
            self.cancelButton?.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(self.alertView.snp_left).offset(10)
                make.right.equalTo(self.alertView.snp_centerX).offset(-5)
                make.top.equalTo(self.messageLabel.snp_bottom).offset(10)
                make.bottom.equalTo(self.alertView.snp_bottom).offset(-10)
                make.height.equalTo(44)
            })
            let btn = self.buttonArray[0]
            btn.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(self.alertView.snp_centerX).offset(5)
                make.right.equalTo(self.alertView.snp_right).offset(-10)
                make.top.equalTo(self.messageLabel.snp_bottom).offset(10)
                make.bottom.equalTo(self.alertView.snp_bottom).offset(-10)
                make.height.equalTo(44)
            })
        }
        //如果有取消按钮，且其他按钮不止一个的时候
        if self.cancelString?.characters.count != nil && self.otherButtonString.count > 1 {
            self.cancelButton?.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(self.alertView.snp_left).offset(10)
                make.right.equalTo(self.alertView.snp_right).offset(-10)
                make.top.equalTo(self.messageLabel.snp_bottom).offset(10)
                make.height.equalTo(44)
            })
            for (index, btn) in self.buttonArray.enumerate() {
                if index == 0 {
                    btn.snp_makeConstraints(closure: { (make) in
                        make.left.equalTo(self.alertView.snp_left).offset(10)
                        make.right.equalTo(self.alertView.snp_right).offset(-10)
                        make.top.equalTo((self.cancelButton?.snp_bottom)!).offset(10)
                        make.height.equalTo(44)
                    })
                }else{
                    let lastBtn = self.buttonArray[index - 1]
                    if index == self.buttonArray.count - 1 {
                        btn.snp_makeConstraints(closure: { (make) in
                            make.left.equalTo(self.alertView.snp_left).offset(10)
                            make.right.equalTo(self.alertView.snp_right).offset(-10)
                            make.top.equalTo(lastBtn.snp_bottom).offset(10)
                            make.height.equalTo(44)
                            make.bottom.equalTo(self.alertView.snp_bottom).offset(-10)
                        })
                    }else{
                        btn.snp_makeConstraints(closure: { (make) in
                            make.left.equalTo(self.alertView.snp_left).offset(10)
                            make.right.equalTo(self.alertView.snp_right).offset(-10)
                            make.top.equalTo(lastBtn.snp_bottom).offset(10)
                            make.height.equalTo(44)
                        })
                    }
                    
                }
            }
        }
        //如果只有取消按钮的时候
        if self.cancelString?.characters.count != nil && self.otherButtonString.count == 0 {
            self.cancelButton!.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(self.alertView.snp_left).offset(10)
                make.top.equalTo(self.messageLabel.snp_bottom).offset(10)
                make.right.equalTo(self.alertView.snp_right).offset(-10)
                make.height.equalTo(44)
                make.bottom.equalTo(self.alertView.snp_bottom).offset(-10)
            })
        }
        
        
        //如果只有其他按钮的时候（只有一个的情况和两个的时候，还有大于两个的时候）
        if self.cancelString?.characters.count == nil && self.otherButtonString.count > 0 {
            if self.buttonArray.count == 1 {
                let btn = self.buttonArray[0]
                btn.snp_makeConstraints(closure: { (make) in
                    make.left.equalTo(self.alertView.snp_left).offset(10)
                    make.right.equalTo(self.alertView.snp_right).offset(-10)
                    make.top.equalTo(self.messageLabel.snp_bottom).offset(10)
                    make.height.equalTo(44)
                    make.bottom.equalTo(self.alertView.snp_bottom).offset(-10)
                })
            }
            if self.buttonArray.count == 2 {
                let btn1 = self.buttonArray[0]
                btn1.snp_makeConstraints(closure: { (make) in
                    make.left.equalTo(self.alertView.snp_left).offset(10)
                    make.top.equalTo(self.messageLabel.snp_bottom).offset(10)
                    make.right.equalTo(self.alertView.snp_centerX).offset(-5)
                    make.bottom.equalTo(self.alertView.snp_bottom).offset(-10)
                    make.height.equalTo(44)
                })
                let btn2 = self.buttonArray[1]
                btn2.snp_makeConstraints(closure: { (make) in
                    make.left.equalTo(self.alertView.snp_centerX).offset(5)
                    make.top.equalTo(self.messageLabel.snp_bottom).offset(10)
                    make.right.equalTo(self.alertView.snp_right).offset(-10)
                    make.bottom.equalTo(self.alertView.snp_bottom).offset(-10)
                    make.height.equalTo(44)
                })
            }
            if self.buttonArray.count > 2 {
                for (index, btn) in self.buttonArray.enumerate() {
                    if index == 0 {
                        btn.snp_makeConstraints(closure: { (make) in
                            make.left.equalTo(self.alertView.snp_left).offset(10)
                            make.right.equalTo(self.alertView.snp_right).offset(-10)
                            make.top.equalTo(self.messageLabel.snp_bottom).offset(10)
                            make.height.equalTo(44)
                        })
                    }else{
                        let lastBtn = self.buttonArray[index - 1]
                        if index == self.buttonArray.count - 1 {
                            btn.snp_makeConstraints(closure: { (make) in
                                make.left.equalTo(self.alertView.snp_left).offset(10)
                                make.right.equalTo(self.alertView.snp_right).offset(-10)
                                make.top.equalTo(lastBtn.snp_bottom).offset(10)
                                make.height.equalTo(44)
                                make.bottom.equalTo(self.alertView.snp_bottom).offset(-10)
                            })
                        }else{
                            btn.snp_makeConstraints(closure: { (make) in
                                make.left.equalTo(self.alertView.snp_left).offset(10)
                                make.right.equalTo(self.alertView.snp_right).offset(-10)
                                make.top.equalTo(lastBtn.snp_bottom).offset(10)
                                make.height.equalTo(44)
                            })
                        }
                        
                    }
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateModeStyle() {
        if self._mode == .Default || self._mode == .Success {
            self.logoView.ss_drawCheckMark()
            self.cancelButton?.setTitleColor(SUCCESS_COLOR, forState: .Normal)
            self.cancelButton?.layer.borderColor = SUCCESS_COLOR.CGColor
            for button in self.buttonArray {
                button.backgroundColor = SUCCESS_COLOR
            }
        }
        if self._mode == .Warning {
            self.logoView.ss_drawWarning()
            self.cancelButton?.setTitleColor(WARNING_COLOR, forState: .Normal)
            self.cancelButton?.layer.borderColor = WARNING_COLOR.CGColor
            for button in self.buttonArray {
                button.backgroundColor = WARNING_COLOR
            }
        }
        if self._mode == .Error {
            self.logoView.ss_drawError()
            self.cancelButton?.setTitleColor(ERROR_COLOR, forState: .Normal)
            self.cancelButton?.layer.borderColor = ERROR_COLOR.CGColor
            for button in self.buttonArray {
                button.backgroundColor = ERROR_COLOR
            }
        }
    }
    
    
    
}




























