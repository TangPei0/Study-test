//
//  AnimtViewController.swift
//  Test
//
//  Created by 培 唐 on 2017/7/14.
//  Copyright © 2017年 唐培. All rights reserved.
//

import UIKit

class AnimtViewController: UIViewController {

    var v1 : UIView!
    var v2 : UIView!
    var v3 : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let btn = UIButton(frame: CGRect(x: 100, y: 0, width: 100, height: 50))
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.addSubview(btn)
        
        let nextbtn = UIButton(frame: CGRect(x: 220, y: 0, width: 100, height: 50))
        nextbtn.backgroundColor = UIColor.green
        nextbtn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        view.addSubview(nextbtn)
        
        
        let testView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.addSubview(testView)
        
        v1 = UIView(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        v1.layer.contents = UIImage(named: "1")?.cgImage
        testView.addSubview(v1)
        
//        v2 = UIView(frame: CGRect(x: 120, y: 100, width: 100, height: 100))
//        v2.layer.contents = UIImage(named: "2")?.cgImage
//        view.addSubview(v2)
//        
//        v3 = UIView(frame: CGRect(x: 240, y: 100, width: 100, height: 100))
//        v3.layer.contents = UIImage(named:"3")?.cgImage
//        view.addSubview(v3)
        
        animationTest()
        
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let anim = CATransition.init()
        anim.duration = 2
        anim.type = "oglFlip"
        anim.subtype = kCATransitionFromRight
        v1.layer.add(anim, forKey: nil)
        
    }
    
    func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func nextPage(){
//        let avc = AnimtViewController()
//        self.present(avc, animated: true, completion: nil)
    }

    func animationTest(){
        //矩形
//        let path = UIBezierPath(rect: CGRect(x: 200, y: 220, width: 200, height: 200))
//        let ly1 = CAShapeLayer()
//        ly1.path = path.cgPath
//        ly1.fillColor = UIColor.orange.cgColor
//        view.layer.addSublayer(ly1)
        
       //圆角
//        let path = UIBezierPath(roundedRect: CGRect(x: 200, y: 220, width: 200, height: 200), cornerRadius: 20)
//        let ly1 = CAShapeLayer()
//        ly1.path = path.cgPath
//        ly1.fillColor = UIColor.purple.cgColor
//        ly1.strokeColor = UIColor.blue.cgColor
//        view.layer.addSublayer(ly1)
        
        //椭圆
//        let path = UIBezierPath(ovalIn: CGRect(x: 100, y: 200, width: 200, height: 120))
//        let ly1 = CAShapeLayer()
//        ly1.path = path.cgPath
//        ly1.fillColor = UIColor.purple.cgColor
//        view.layer.addSublayer(ly1)
        
        //指定圆角
//        let path = UIBezierPath(roundedRect: CGRect(x: 100, y: 200, width: 200, height: 120), byRoundingCorners: UIRectCorner(rawValue: 0xB), cornerRadii: CGSize(width: 50, height: 20))
//        let ly1 = CAShapeLayer()
//        ly1.path = path.cgPath
//        ly1.fillColor = UIColor.purple.cgColor
//        view.layer.addSublayer(ly1)
        
        //扇形
//        let path = UIBezierPath(arcCenter: CGPoint(x: 100, y: 300), radius: 50, startAngle: 0.1, endAngle:0.9, clockwise: true)
//        let ly1 = CAShapeLayer()
//        ly1.path = path.cgPath
//        ly1.fillColor = UIColor.purple.cgColor
//        view.layer.addSublayer(ly1)
    }
    
    
}
