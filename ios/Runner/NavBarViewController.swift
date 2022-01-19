//
//  NavBarViewController.swift
//  Runner
//
//  Created by Rake Yang on 2022/1/17.
//

import UIKit
import SwifterSwift

class NavBarViewController: UIViewController, UIGestureRecognizerDelegate {
    
    lazy var navBar = NavBarView(frame: CGRect(x: 0, y: 0, width: view.width, height: UIApplication.shared.statusBarFrame.height + 44))

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(hex: 0xF2F3F6)
        view.addSubview(navBar)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return navigationController?.viewControllers.count ?? 0 > 1
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
