//
//  DateViewController.swift
//  Test
//
//  Created by 培 唐 on 2017/7/21.
//  Copyright © 2017年 唐培. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {

    var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let date = Date()
        print(date) //输出为UTC时间,比北京时间少8小时,时区问题
        
        //方法一:加8个小时
        let date1 = Date().addingTimeInterval(TimeInterval(8*60*60))
        print(date1)
        
        //方法二:设置dateFormat
        let date2 = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd/HH:mm:ss"
        print(dateFormatter.string(from: date2))
        
        //方法三: 
        let date3 = Date()
        let dateFormat = DateFormatter()
        //dateFormat.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        dateFormat.timeZone = TimeZone(identifier: "Local")
        print(dateFormat.string(from: date3))
        
        
        
        
        
        label = UILabel(frame: CGRect(x: 50, y: 50, width: 280, height: 50))
        label.text = date.description
        view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
