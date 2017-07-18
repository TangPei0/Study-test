//
//  ThreadViewController.swift
//  Test
//
//  Created by 培 唐 on 2017/7/17.
//  Copyright © 2017年 唐培. All rights reserved.
//

import UIKit

class ThreadViewController: UIViewController {

    var thread1: Thread?
    var thread2: Thread?
    
    var count: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<3{
            let btn = UIButton(frame: CGRect(x: 40, y: 40+100*i, width: 200, height: 40))
            btn.setTitle("线程\(i+1)启动", for: .normal)
            btn.backgroundColor = UIColor.red
            btn.titleLabel?.textColor = UIColor.black
            btn.tag = i+1
            btn.addTarget(self, action: #selector(btnPress(_ :)), for: .touchUpInside)
            view.addSubview(btn)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnPress(_ sender: UIButton){
        if sender.tag == 1{
            print("线程1启动")
            
            let thread = Thread.init(target: self, selector: #selector(thread1Act), object: nil)
            thread.start()
            
        }else if sender.tag == 2{
            print("线程2启动")
            
            thread1 = Thread.init(block: {
                for i in 0..<5{
                    print("线程2: \(i)")
                }
            })
            thread1?.start()
            
        }else{
            print("线程3启动")
            
            Thread.detachNewThreadSelector(#selector(thread2Act), toTarget: self, with: nil)
        }
    }
    func thread1Act(){
        
        for i in 0..<20{
            count = i
            print("线程1: \(count!)")
        }
        print("线程1输出结束,count值为\(count!)")
    }
    
    func thread2Act(){
        for i in 20..<30{
            count = i
            print("线程3: \(count!)")
        }
        print("线程3输出结束,count值为\(count!)")
    }
    
   }
