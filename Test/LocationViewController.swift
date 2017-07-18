//
//  LocationViewController.swift
//  Test
//
//  Created by 培 唐 on 2017/7/17.
//  Copyright © 2017年 唐培. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class LocationViewController: UIViewController , CLLocationManagerDelegate{

    var locationManager: CLLocationManager!
    var currLocation: CLLocation!
    var versionCode : String = UIDevice.current.systemVersion
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let version = NSString(string: versionCode).doubleValue
        
        
        locationManager = CLLocationManager() //位置管理器
        locationManager.delegate = self
        //定位精确度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //最高精度
        //重新定位最小变化距离
        locationManager.distanceFilter = kCLLocationAccuracyKilometer//精确至千米
        
        if version>=8.0 {
            //授权请求
            //设置何时开启定位状态
            locationManager.requestAlwaysAuthorization()
            //使用程序期间允许访问位置
            locationManager.requestWhenInUseAuthorization()
            //启动定位
            locationManager.startUpdatingLocation()
        }
        
    }

    //CoreLocationManagerDelegate 中获取到位置信息的处理函数
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location : CLLocation = locations.last! as CLLocation// locations[locations.count-1] as CLLocation
        
        //当前位置
        currLocation = location
        
        if location.horizontalAccuracy>0 {
            print("纬度\(location.coordinate.latitude) 经度\(location.coordinate.longitude)")
            self.locationManager.stopUpdatingLocation()
            print("结束定位")
        }
        
        print(currLocation)
        
        ///使用坐标，获取地址
        let geocoder = CLGeocoder()
        var place: CLPlacemark?
        geocoder.reverseGeocodeLocation(currLocation) { (placemarks, error) in
            if error != nil{
                print("错误：\(error!.localizedDescription)")
                return
            }
            
            
            
        }
        
    }
    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error)
//    }

}
