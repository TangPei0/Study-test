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

protocol ChangeBgViewDelegate: NSObjectProtocol {
    func changeBG(bgimg: UIImage)
}

class SecondViewController: UIViewController {

    var passValue : String?
    var delegate: ChangeColorDelegate?
    var bgdelegate: ChangeBgViewDelegate?
    
    var block: ((UIColor)->())?
    var bgBlock: ((UIImage)->())?
    
    var i : Int! = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan
        //上页传来的"biu"
        print(self.passValue ?? "")
        self.title = self.passValue
        
        let rbtn = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        rbtn.backgroundColor = UIColor.black
        rbtn.addTarget(self, action: #selector(rbtnClick), for: .touchUpInside)
        view.addSubview(rbtn)
        
        let nextbtn = UIButton(frame: CGRect(x: 200, y: 0, width: 150, height: 50))
        nextbtn.backgroundColor = UIColor.black
        nextbtn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        view.addSubview(nextbtn)

        
        for i in 0..<3 {
            let btn = UIButton(frame: CGRect(x: 0+120*i, y: 100, width: 100, height: 50))
            btn.setTitle("第\(i+1)个按钮", for: .normal)
            btn.addTarget(self, action: #selector(changeBGView(_:)), for: .touchUpInside)
            btn.tag = i
            view.addSubview(btn)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rbtnClick(){
        //self.delegate?.changeColor(tempColor: UIColor.yellow)
        //self.block!(UIColor.yellow)
        self.bgdelegate?.changeBG(bgimg: UIImage(named: "bg\(i+1)")!)
        self.bgBlock!(UIImage(named: "bg\(i+1)")!)
        self.dismiss(animated: true, completion: nil)
    }
    
    func nextPage(){
        let dVC = DispatchTestViewController()
        self.present(dVC, animated: true, completion: nil)
    }
    
    func changeBGView(_ sender: UIButton){
        if sender.tag == 0 {
            self.bgdelegate?.changeBG(bgimg: UIImage(named: "bg1")!)
            i = sender.tag
        }else if sender.tag == 1{
            self.bgdelegate?.changeBG(bgimg: UIImage(named: "bg2")!)
            i = sender.tag
        }else{
            self.bgdelegate?.changeBG(bgimg: UIImage(named: "bg3")!)
            i = sender.tag
        }
        
    }
}
