//
//  ViewController.swift
//  Proxy
//
//  Created by Jon Hoffman on 9/5/17.
//  Copyright © 2017 Jon Hoffman. All rights reserved.
//

import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getItunesSearch(searchTerm: "jimmy+buffett")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func getItunesSearch(searchTerm: String) {
        let proxy = ITunesProxy()
        proxy.sendGetRequest(searchTerm: searchTerm) {
            if let data = $0, let sString = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
                print(sString)

            } else {
                print("Data is nil")
            }
        }
    }

}
