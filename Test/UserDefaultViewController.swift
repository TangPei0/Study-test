//
//  UserDefaultViewController.swift
//  Test
//
//  Created by 培 唐 on 2017/7/19.
//  Copyright © 2017年 唐培. All rights reserved.
//

import UIKit

class UserDefaultViewController: UIViewController {

    var  usdef : UserDefaults!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let writeBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 150, height: 50))
        writeBtn.setTitle("写入", for: .normal)
        writeBtn.setTitleColor(UIColor.blue, for: .normal)
        writeBtn.addTarget(self, action: #selector(writeBtnClick), for: .touchUpInside)
        view.addSubview(writeBtn)
        
        let readBtn = UIButton(frame: CGRect(x: 100, y: 200, width: 150, height: 50))
        readBtn.setTitle("读取", for: .normal)
        readBtn.setTitleColor(UIColor.blue, for: .normal)
        readBtn.addTarget(self, action: #selector(readBtnClick), for: .touchUpInside)
        view.addSubview(readBtn)
        
        usdef = UserDefaults.standard
        
        
        
    }
    
    func writeBtnClick(){
        usdef.set("Sandy", forKey: "Name")
        usdef.set(1.85, forKey: "Height")
        usdef.set(20, forKey: "Age")
        usdef.set(["Jay","Eason","Liu"], forKey: "Idol")
    }
    
    func readBtnClick(){
        
        var obj : Any = usdef.object(forKey: "Name") as Any
        let name : String = obj as! String
        print(name)
        
        obj = usdef.object(forKey: "Idol") as Any
        let array : [String] = obj as! [String]
        for i in 0..<array.count{
            print("\(name) 的 Idol 是 \(array[i])")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
