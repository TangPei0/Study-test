//
//  FirstViewController.swift
//  Test
//
//  Created by 培 唐 on 2017/7/13.
//  Copyright © 2017年 唐培. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, ChangeBgViewDelegate {
//    func changeColor(tempColor: UIColor) {
//        //下页传回的颜色
//        self.view.backgroundColor = tempColor
//    }
    
    var bgView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height))
    
    func changeBG(bgimg : UIImage){
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(bgView)
        
        let  btn = UIButton(frame: CGRect(x: 120, y: 120, width: 150, height: 50))
        btn.backgroundColor = UIColor.darkGray
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        view.addSubview(btn)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func btnClick(){
        let svc = SecondViewController()
        svc.passValue = "biu~"
        svc.bgdelegate = self
//        svc.block = {(tempColor: UIColor)-> Void in
//            self.view.backgroundColor = tempColor
//        }
        svc.bgBlock = {(bgimg:UIImage) in
            self.bgView.image = bgimg
        }
        self.present(svc, animated: true, completion: nil)
    }
    
}


