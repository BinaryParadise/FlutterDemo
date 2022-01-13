//
//  ViewController.swift
//  Playing
//
//  Created by Rake Yang on 2022/1/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(true, animated: false)
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .white
            navigationController?.navigationBar.standardAppearance = appearance
        } else {
            navigationController?.navigationBar.backgroundColor = .orange
        }
    }
    
    @IBAction func openFlutter() {
        let options = FlutterBoostRouteOptions()
        options.pageName = "/"
        options.arguments = [:]
        options.completion = { finished in
            // push完成
        }
        
        options.onPageFinished = { args in
            // 页面关闭
        }
        
        FlutterBoost.instance().open(options);
    }

}

