//
//  FirstViewController.swift
//  Runner
//
//  Created by Rake Yang on 2022/1/13.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let btn1 = UIButton(type: .custom)
        btn1.backgroundColor = .systemOrange
        btn1.layer.cornerRadius = 4
        btn1.frame = CGRect(x: 30, y: 128, width: 220, height: 50)
        btn1.setTitle("打开Flutter页面", for: .normal)
        view.addSubview(btn1)
        btn1.addTarget(self, action: #selector(openFlutter(sender:)), for: .touchUpInside)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    @IBAction func openFlutter(sender: Any) {
        //let rootVC = FBFlutterViewContainer(project: nil, initialRoute: "/", nibName: nil, bundle: nil)
        //rootVC.setName("/", uniqueId: "0", params: nil, opaque: true)
        FlutterBoost.instance().open("flutter://home", arguments: ["back": true]) { finished in
            
        }
    }
}
