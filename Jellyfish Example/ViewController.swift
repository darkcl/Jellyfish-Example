//
//  ViewController.swift
//  Jellyfish Example
//
//  Created by Yeung Yiu Hung on 12/3/2018.
//  Copyright © 2018年 Yeung Yiu Hung. All rights reserved.
//

import UIKit

import Jellyfish

import Alamofire

class ViewController: UIViewController {

    var sessionManager: SessionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let request: NSMutableURLRequest = NSMutableURLRequest(url: URL(string: "https://example.com/message")!)
        WebRequestHelper.makeRequest(request: request as URLRequest) { (data, res , err) in
            print("===================SHARED")
            
            if let data = data {
                print(String(data: data, encoding: .utf8) ?? "")
            }
            
            if let error = err {
                print(error)
            }
        }
        
        let request2: NSMutableURLRequest = NSMutableURLRequest(url: URL(string: "http://httpbin.org/get")!)
        WebRequestHelper.makeRequest(request: request2 as URLRequest) { (data, res , err) in
            print("==================SHARED")
            if let data = data {
                print(String(data: data, encoding: .utf8) ?? "")
            }
            
            if let error = err {
                print(error)
            }
        }
        
        
        // Alamofire
        
        let configuration = URLSessionConfiguration.jellyfishConfiguration
        
        sessionManager = Alamofire.SessionManager(configuration: configuration)
        
        sessionManager.request("https://example.com/message").responseString { result in
            print("==================Alamofire")
            print(result.description)
        }
        
        sessionManager.request("http://httpbin.org/get").responseString { result in
            print("==================Alamofire")
            print(result.description)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

