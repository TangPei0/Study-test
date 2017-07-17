//
//  OperationViewController.swift
//  Test
//
//  Created by 培 唐 on 2017/7/17.
//  Copyright © 2017年 唐培. All rights reserved.
//

import UIKit

class OperationViewController: UIViewController {

    var operationQueue : OperationQueue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operationQueue = OperationQueue.init()
        operationQueue.maxConcurrentOperationCount = 5
        let oper = TestOperation()
        operationQueue.addOperation(oper)
        operationQueue.addOperation { 
            for i in 0..<2{
                print(i)
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

class TestOperation : Operation{
    override func main() {
        print("Operation test!")
    }
}
