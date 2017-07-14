//
//  SecondViewController.swift
//  Test
//
//  Created by 培 唐 on 2017/7/13.
//  Copyright © 2017年 唐培. All rights reserved.
//

import UIKit

protocol ChangeColorDelegate: NSObjectProtocol{
    
    func changeColor(tempColor: UIColor)
}

class SecondViewController: UIViewController {

    var passValue : String?
    var delegate: ChangeColorDelegate?
    
    var block: ((UIColor)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan
        //上页传来的"biu"
        print(self.passValue ?? "")
        self.title = self.passValue
        
        let rbtn = UIButton(frame: CGRect(x: 120, y: 120, width: 150, height: 150))
        rbtn.backgroundColor = UIColor.black
        rbtn.addTarget(self, action: #selector(rbtnClick), for: .touchUpInside)
        view.addSubview(rbtn)
        
        let nextbtn = UIButton(frame: CGRect(x: 240, y: 450, width: 150, height: 150))
        nextbtn.backgroundColor = UIColor.black
        nextbtn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        view.addSubview(nextbtn)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rbtnClick(){
        self.delegate?.changeColor(tempColor: UIColor.yellow)
        self.block!(UIColor.yellow)
        self.dismiss(animated: true, completion: nil)
    }
    
    func nextPage(){
        let dVC = DispatchTestViewController()
        self.present(dVC, animated: true, completion: nil)
    }
    
}
