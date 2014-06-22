//
//  KeyboardViewController.swift
//  MyCustumKeyboard
//
//  Created by Muhammad Zohaib Brohi on 21/06/2014.
//  Copyright (c) 2014 Muhammad Zohaib Brohi. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton
    @IBOutlet var tempButton: UIButton
    @IBOutlet var btn_hello: UIButton
    @IBOutlet var btn_hi: UIButton
    @IBOutlet var btn_你好: UIButton
    @IBOutlet var btn_Bonjour: UIButton
    @IBOutlet var btn_नमस्ते: UIButton
    @IBOutlet var btn_السلامعلیکم: UIButton
    @IBOutlet var btn_今日は: UIButton
    @IBOutlet var btn_Space: UIButton
    
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    func createButton(#title : String) -> UIButton
    {
        self.tempButton = UIButton.buttonWithType(.System) as UIButton
        
        self.tempButton.setTitle(NSLocalizedString(title, comment: "My button"), forState: .Normal)
        self.tempButton.sizeToFit()
        self.tempButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.tempButton.titleLabel.font = UIFont(name: "Helvetica", size: 30)
        
        self.tempButton.addTarget(self, action: "onClick:", forControlEvents: .TouchUpInside)
        
        return tempButton
    }
    
    func createLayout(#btn : UIButton,positionX : NSLayoutAttribute,positionY : NSLayoutAttribute)
    {
        var ButtonCenterXConstraint = NSLayoutConstraint(item: btn, attribute: positionX, relatedBy: .Equal, toItem: self.view, attribute: positionX, multiplier: 1.0, constant: 0.0)
        var ButtonCenterYConstraint = NSLayoutConstraint(item: btn, attribute: positionY, relatedBy: .Equal, toItem: self.view, attribute: positionY, multiplier: 1.0, constant: 0.0)
        
        self.view.addConstraints([ButtonCenterXConstraint, ButtonCenterYConstraint])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.nextKeyboardButton.titleLabel.font = UIFont(name: "Helvetica", size: 10)
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
        
        
        // Create Button With Title and Action Listner
        self.btn_hello = createButton(title: "Hello")
        self.btn_hi = createButton(title: "Hi")
        self.btn_你好 = createButton(title: "你好")
        self.btn_Bonjour = createButton(title: "Bonjour")
        self.btn_नमस्ते = createButton(title: "नमस्ते")
        self.btn_السلامعلیکم = createButton(title: "السلامعلیکم")
        self.btn_今日は = createButton(title: "今日は")
        self.btn_Space = createButton(title: "Space")
        
        // Adding Button On Layout
        self.view.addSubview(self.btn_hello)
        self.view.addSubview(self.btn_hi)
        self.view.addSubview(self.btn_你好)
        self.view.addSubview(self.btn_Bonjour)
        self.view.addSubview(self.btn_नमस्ते)
        self.view.addSubview(self.btn_السلامعلیکم)
        self.view.addSubview(self.btn_今日は)
        self.view.addSubview(self.btn_Space)
        
        
        // Defining Position for Buttons
        createLayout(btn: btn_hello, positionX: NSLayoutAttribute.CenterX, positionY: NSLayoutAttribute.CenterY)
        createLayout(btn: btn_hi, positionX: NSLayoutAttribute.Left, positionY: NSLayoutAttribute.Top)
        createLayout(btn: btn_你好, positionX: NSLayoutAttribute.CenterX, positionY: NSLayoutAttribute.Top)
        createLayout(btn: btn_Bonjour, positionX: NSLayoutAttribute.Right, positionY: NSLayoutAttribute.Top)
        createLayout(btn: btn_नमस्ते, positionX: NSLayoutAttribute.Right, positionY: NSLayoutAttribute.CenterY)
        createLayout(btn: btn_السلامعلیکم, positionX: NSLayoutAttribute.Left, positionY: NSLayoutAttribute.CenterY)
        createLayout(btn: btn_今日は, positionX: NSLayoutAttribute.Right, positionY: NSLayoutAttribute.Bottom)
        createLayout(btn: btn_Space, positionX: NSLayoutAttribute.CenterX, positionY: NSLayoutAttribute.Bottom)
    }
    
    
    
    func onClick(sender:UIButton!) {
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        var btn_title = sender.currentTitle
        if(btn_title.bridgeToObjectiveC().containsString("Space"))
        {
            proxy.insertText(" ")
        }
        else{
            proxy.insertText(sender.currentTitle)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
        self.btn_hello.setTitleColor(textColor, forState: .Normal)
        self.btn_hi.setTitleColor(textColor, forState: .Normal)
        self.btn_你好.setTitleColor(textColor, forState: .Normal)
        self.btn_Bonjour.setTitleColor(textColor, forState: .Normal)
        self.btn_नमस्ते.setTitleColor(textColor, forState: .Normal)
        self.btn_السلامعلیکم.setTitleColor(textColor, forState: .Normal)
        self.btn_今日は.setTitleColor(textColor, forState: .Normal)
        self.btn_Space.setTitleColor(textColor, forState: .Normal)
        
    }
    
}
