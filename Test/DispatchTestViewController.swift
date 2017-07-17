//
//  DispatchTestViewController.swift
//  Test
//
//  Created by 培 唐 on 2017/7/14.
//  Copyright © 2017年 唐培. All rights reserved.
//

import UIKit

class DispatchTestViewController: UIViewController {

    
    var inactiveQueue: DispatchQueue!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let btn = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 50))
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.addSubview(btn)
        
        let nextbtn = UIButton(frame: CGRect(x: 220, y: 200, width: 100, height: 50))
        nextbtn.backgroundColor = UIColor.red
        nextbtn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        view.addSubview(nextbtn)
        
        //dpTest()
        //djdpTest()
        
//        if let queue = inactiveQueue {
//            queue.activate()
//        }
        
        workItemTest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func nextPage(){
        let avc = AnimtViewController()
        self.present(avc, animated: true, completion: nil)
    }

    //串行.并行.主线程
    func dpTest(){
        let queue = DispatchQueue(label: "dp.test")
        
        DispatchQueue.global().sync {
            print(Thread.current)
        }
        //同步队列(串行)
        queue.sync {
            for i in 0..<5{
                print("同步",i)
            }
        }
        
        //异步队列(并行执行)
        queue.async {
            for k in 0..<5{
                print("异步",k)
            }
        }
        DispatchQueue.global().async {
            print(Thread.current)
        }
        //主队列(同为串行)
        for j in 0...5{
            print("主",j)
        }
        
    }
    
    
    //等级队列
    /*1.QoS(服务等级):优先级从高到低(高的先执行):
     userInteractive(和用户交相互关，比如动画等等优先级最高。比如用户连续拖拽的计算),
     userInitiated(用户期望优先级(不能太耗时),需要立刻的结果，比如push1个ViewController之前的数据计算),
     default(默认的),
     utility(公共的,可以履行很长时间，再通知用户结果。比以下载1个文件，给用户下载进度),
     background(用户不可见，比如在后台存储大量数据),
     unspecified(不指定)*/
    //2.attributes:.concurrent(同等级并行), initiallyInactive(不活跃的,需要调用DispatchQueue类的`activate()`让任务执行)
    //3.autoreleaseFrequency(自动释放频率):workItem(把任务封装成了1个对象), inherit(), never()
    //4.target(dispatchqueue可选值)
    func djdpTest(){
        /*
         //同等级异步
         let queue = DispatchQueue(label: "djdp", qos: .unspecified, attributes: .concurrent, autoreleaseFrequency: .workItem, target: nil)
        queue.async {
            for i in 0..<5{
                print("test1",i)
            }
        }
        queue.async {
            for i in 5..<10{
                print("test2",i)
            }
        }
         */
        
        /*
         //非同等级异步与主线程
        let queue1 = DispatchQueue(label: "que1", qos: .utility, attributes: .concurrent, autoreleaseFrequency: .workItem, target: nil)
        let queue2 = DispatchQueue(label: "que2", qos: .userInteractive, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)

        queue1.async {
            for i in 0..<5{
                print("que1", i)
            }
        }
        queue2.async {
            for i in 5..<10{
                print("que2",i)
            }
        }
        
        for i in 10..<15{
            print("主",i)
        }
        */
        
        /*
         //buhuoyue
        let queue = DispatchQueue(label: "que", qos: .utility, attributes: .initiallyInactive, autoreleaseFrequency: .inherit, target: nil)
        inactiveQueue = queue
        
        queue.async {
            for i in 0..<5{
                print("t1",i)
            }
        }
        queue.async {
            for i in 5..<10{
                print("t2",i)
            }
        }
         此时为串行输出,而Qos队列的attributes接收的是一个数组,将上面的attributes改为[.initiallyInactive, .concurrent]
 
        //延时执行
        queue.asyncAfter(deadline: .now()+0.5) {
            print("------------------")
        }
    */
    }
    
    
    //DispatchWorkItem是一个代码块，它可以被分到任何的队列，包含的代码可以在后台或主线程中被执行，简单来说:它被用于替换我们前面写的代码block来调用
    func workItemTest(){
        var num = 1
        
        let workItem : DispatchWorkItem = DispatchWorkItem{
            num = num + 5
        }
        
        workItem.perform() // 激活代码块
        
        let queue = DispatchQueue.global()
        queue.async(execute: workItem)
        workItem.notify(queue: DispatchQueue.main) { 
            print("workItem完成通知: ", num)
        }
    }
    
    
}
