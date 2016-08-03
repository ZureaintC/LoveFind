//
//  ViewController.swift
//  LoveFind
//
//  Created by 付晨 on 16/8/3.
//  Copyright © 2016年 付晨. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var sex: UISegmentedControl!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var height: UISlider!
    @IBOutlet weak var heightnumber: UILabel!
    @IBOutlet weak var result: UITextView!
    @IBOutlet weak var hasHome: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func heightChange(sender: AnyObject) {
        let i: Int
        let slider = sender as! UISlider
        i=Int(slider.value)
        heightnumber.text="\(i)cm"
        
    }
    @IBAction func okTap(sender: AnyObject) {
        let nameText = name.text?.characters.count > 0 ? name.text! : "无名氏"
        let sexText = sex.selectedSegmentIndex == 0 ? "高富帅" : "白富美"
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        let components = gregorian?.components([.Year], fromDate: birthday.date, toDate: now,options: NSCalendarOptions(rawValue: 0))
        let age = components?.year
        let hasHomeText = hasHome.on ? "有房" : "没房"
        result.text="\(nameText),\(sexText),\(age!)岁,身高\(heightnumber.text!)\(hasHomeText)"
        
    }
    
    //UITextFiledDeledate
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}

