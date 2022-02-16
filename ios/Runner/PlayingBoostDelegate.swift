//
//  PlayingBoostDelegate.swift
//  Runner
//
//  Created by Rake Yang on 2022/1/13.
//

import UIKit
import Flutter

class PlayingNavigator: NSObject {
    static var shared = PlayingNavigator()
    var navigationController: UINavigationController?
    var resultTable: [String: ([AnyHashable:Any]?)->Void] = [:]
    weak var engine: FlutterEngine!
    
    static func pushFlutter(_ route: String) {
        let vc = FlutterContainerViewController(engine: shared.engine, nibName: nil, bundle: nil)
        shared.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*func pushNativeRoute(_ pageName: String!, arguments: [AnyHashable : Any]!) {
        if pageName == "native://middle" {
            navigationController?.pushViewController(NativeViewController(), animated: true)
        }
    }
    
    func popRoute(_ options: FlutterBoostRouteOptions!) {
        //如果当前被present的vc是container，那么就执行dismiss逻辑
        if let vc = self.navigationController?.presentedViewController as? FBFlutterViewContainer,vc.uniqueIDString() == options.uniqueId{
            
            //这里分为两种情况，由于UIModalPresentationOverFullScreen下，生命周期显示会有问题
            //所以需要手动调用的场景，从而使下面底部的vc调用viewAppear相关逻辑
            if vc.modalPresentationStyle == .overFullScreen {
                
                //这里手动beginAppearanceTransition触发页面生命周期
                self.navigationController?.topViewController?.beginAppearanceTransition(true, animated: false)
                
                vc.dismiss(animated: true) {
                    self.navigationController?.topViewController?.endAppearanceTransition()
                }
            }else{
                //正常场景，直接dismiss
                vc.dismiss(animated: true, completion: nil)
            }
        }else{
            self.navigationController?.popViewController(animated: true)
        }
        //否则直接执行pop逻辑
        //这里在pop的时候将参数带出,并且从结果表中移除
        if let onPageFinshed = resultTable[options.pageName] {
            onPageFinshed(options.arguments)
            resultTable.removeValue(forKey: options.pageName)
        }
    }*/
}
