//
//  NativeViewController.swift
//  Runner
//
//  Created by Rake Yang on 2022/1/13.
//

import UIKit

class NativeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let nativeBtn = UIButton(type: .custom)
        nativeBtn.layer.cornerRadius = 6
        nativeBtn.frame = CGRect(x: 30, y: 128, width: 166, height: 40)
        nativeBtn.backgroundColor = .orange
        nativeBtn.setTitle("打开Native页面", for: .normal)
        view.addSubview(nativeBtn)
        nativeBtn.addTarget(self, action: #selector(openNative(sender:)), for: .touchUpInside)
        
        let flutterBtn = UIButton(type: .custom)
        flutterBtn.layer.cornerRadius = 6
        flutterBtn.frame = CGRect(x: 30, y: 188, width: 166, height: 40)
        flutterBtn.backgroundColor = .systemPink
        flutterBtn.setTitle("打开Flutter页面", for: .normal)
        view.addSubview(flutterBtn)
        flutterBtn.addTarget(self, action: #selector(openFlutter(sender:)), for: .touchUpInside)
        
    }
    
    @IBAction func openNative(sender: Any) {
        navigationController?.pushViewController(NativeViewController(), animated: true)
    }
    
    @IBAction func openFlutter(sender: Any) {
        FlutterBoost.instance().open("flutter://middle", arguments: [:]) { finished in
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // flutterboost内部会处理侧滑收拾
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

}
