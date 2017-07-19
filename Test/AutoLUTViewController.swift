//
//  AutoLUTViewController.swift
//  Test
//
//  Created by 培 唐 on 2017/7/18.
//  Copyright © 2017年 唐培. All rights reserved.
//

import UIKit

class AutoLUTViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //创建组件
        let textField = UITextField(frame: CGRect.zero) //这里不再需要刻意制定x,y坐标
        textField.borderStyle = UITextBorderStyle.roundedRect
        self.view.addSubview(textField)
        
        let button = UIButton(type: .system);
        button.setTitle("按钮", for:.normal)
        button.backgroundColor = UIColor(red: 55/255, green: 186/255, blue: 89/255, alpha: 0.5)
        self.view.addSubview(button)
        
        let textView = UITextView(frame: CGRect.zero)
        textView.text="test"
        textView.backgroundColor = UIColor(red: 55/255, green: 186/255, blue: 89/255, alpha: 0.5)
        self.view.addSubview(textView)
        
        //使用Auto Layout的方式来布局
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        //创建一个控件数组
        let views:[String:AnyObject] = ["textField": textField,
                                        "button": button, "textView": textView]
        
        //创建一个水平居中约束（按钮）
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item: button, attribute: .centerX, relatedBy: .equal,
            toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(constraint)
        //创建水平方向约束
        self.view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-5-[textField]-5-|", options:NSLayoutFormatOptions.alignAllCenterX,
            metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-5-[textView]-5-|", options: NSLayoutFormatOptions.alignAllCenterX,
            metrics: nil, views: views))
        //创建垂直方向约束
        self.view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-20-[textField]-20-[textView]-20-[button]-20-|",
            options:NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: views))
        
        
        
        getDay()
    }

    func getDay(){
        let date = NSDate()
        //当前月有多少天
        let range = NSCalendar.current.range(of: .day, in: .month, for: date as Date)
        print(date,range?.count ?? 0)
        
        //哪个月
        let mon = NSCalendar.current.component(Calendar.Component.month, from: date as Date)
        print(mon)
        
        //哪一年
        let year = NSCalendar.current.component(Calendar.Component.year, from: date as Date)
        print(year)
        
        //在当前月是第几天
        let day = NSCalendar.current.component(Calendar.Component.day, from: date as Date)
        print(day)
        
        //
        func numberOfYearsCountAt(formdate: Date? = Date(), toDate: Date? = Date())->Int{
            
            return 0
        }
    }
    

}
