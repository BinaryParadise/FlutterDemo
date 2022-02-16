//
//  FirstViewController.swift
//  Runner
//
//  Created by Rake Yang on 2022/1/13.
//

import UIKit
import SnapKit

class FirstViewController: NavBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                        
        // Do any additional setup after loading the view.
        navBar.title = "Demo"
        let btn1 = UIButton(type: .custom)
        btn1.backgroundColor = .systemOrange
        btn1.layer.cornerRadius = 4
        btn1.setTitle("  打开Flutter页面  ", for: .normal)
        view.addSubview(btn1)
        btn1.addTarget(self, action: #selector(openFlutter(sender:)), for: .touchUpInside)
        btn1.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        let btn2 = UIButton(type: .custom)
        btn2.backgroundColor = .blue
        btn2.layer.cornerRadius = 4
        btn2.setTitle("  打开Native页面  ", for: .normal)
        view.addSubview(btn2)
        btn2.addTarget(self, action: #selector(openNative(sender:)), for: .touchUpInside)
        btn2.snp.makeConstraints { make in
            make.centerX.equalTo(btn1)
            make.top.equalTo(btn1.snp.bottom).offset(20)
        }
        
        let btn3 = UIButton(type: .custom)
        btn3.backgroundColor = .purple
        btn3.layer.cornerRadius = 4
        btn3.setTitle("  添加Flutter组件  ", for: .normal)
        view.addSubview(btn3)
        btn3.addTarget(self, action: #selector(appendFlutter(sender:)), for: .touchUpInside)
        btn3.snp.makeConstraints { make in
            make.centerX.equalTo(btn2)
            make.top.equalTo(btn2.snp.bottom).offset(20)
        }
    }

    @IBAction func openFlutter(sender: Any) {
        PlayingNavigator.pushFlutter("/")
        //let rootVC = FBFlutterViewContainer(project: nil, initialRoute: "/", nibName: nil, bundle: nil)
        //rootVC.setName("/", uniqueId: "0", params: nil, opaque: true)
//        FlutterBoost.instance().open("flutter://home", arguments: ["back": true]) { finished in
//
//        }
    }
    
    @IBAction func openNative(sender: Any) {
        navigationController?.pushViewController(NativeViewController(), animated: true)
    }
    
    @IBAction func appendFlutter(sender: Any) {
        // 可加速首次打开flutter页面
//        let vc = FBFlutterViewContainer()!
//        vc.setName("flutter://warmUpEngine", uniqueId: UUID().uuidString, params: [:], opaque: false)
//        view.addSubview(vc.view)
//        vc.view.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.bottom.equalTo(view.snp.bottomMargin).offset(-20)
//            make.height.equalTo(50)
//            make.width.equalToSuperview().multipliedBy(0.7)
//        }
    }
}
