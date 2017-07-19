//
//  RefreshViewController.swift
//  Test
//
//  Created by 培 唐 on 2017/7/19.
//  Copyright © 2017年 唐培. All rights reserved.
//

import UIKit

class RefreshViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    
    //下拉刷新控件
    var refreshControl: UIRefreshControl!
    var tableView : UITableView!
    //tableView数据源
    var tableData = [Date]()
    var refreshCount = [Int]()
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI实现
        tableView = UITableView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-100))
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //注册可重用tableViewCell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
        
        //refresh控件加到tableview中
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        //重新加载数据
        tableView.reloadData()
    }

    //刷新数据方法
    func refreshData(){
        i += 1
        let data = Date()
        refreshCount.insert(i, at: 0)
        tableData.insert(data, at: 0)
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    //tableview代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        //时间格式设定
        let format = DateFormatter()
        format.dateFormat = "HH:mm:ss"
        let date = format.string(from: tableData[indexPath.row])
        
        let i = refreshCount[indexPath.row]
        //每行数据显示
        cell.textLabel?.text = "现在时间是\(date),刷新第\(i)次"
        return cell
    }
    
}
