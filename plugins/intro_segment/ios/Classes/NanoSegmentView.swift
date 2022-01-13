//
//  NanoSegmentView.swift
//  Runner
//
//  Created by Rake Yang on 2021/12/30.
//

import Foundation
import Flutter
import SnapKit
import SwifterSwift

let SegmentViewName = "com.flutter.intro/segment_viewtype"

class NanoSegmentPlatformView: NSObject, FlutterPlatformView {
    
    var container: NanoSegmentView
    
    init(_ frame: CGRect,viewID: Int64,args :Any?,messenger :FlutterBinaryMessenger) {
        guard let args = args as? [String : Any] else {
            container = NanoSegmentView(frame: frame, data: [], viewId: viewID)
            return
        }

        container = NanoSegmentView(frame: frame, data: args["data"] as? [String] ?? [], viewId: viewID)
        container.methodChannel = FlutterMethodChannel(name: "com.flutter.introl.segment_channel_\(viewID)", binaryMessenger: messenger)
        container.currentIndex = args["currentIndex"] as? Int ?? 0

    }
    
    func view() -> UIView {
        return container
    }
}

class NanoSegmentView: UIView {
    var currentIndex: Int = 0 {
        willSet {
            if let oldBtn = viewWithTag(200 + currentIndex) as? UIButton {
                oldBtn.isSelected = false
                oldBtn.isUserInteractionEnabled = true
                oldBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            }
            if let newBtn = viewWithTag(200 + newValue) as? UIButton {
                newBtn.isSelected = true
                newBtn.isUserInteractionEnabled = false
                newBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                
                // 自动布局动画
                UIView.animate(withDuration: 0.25) {
                    self.indicatorConstraint.deactivate()
                    self.indicator.snp.makeConstraints { make in
                        self.indicatorConstraint = make.centerX.equalTo(newBtn).constraint
                    }
                    self.indicator.superview?.layoutIfNeeded()
                }
            }
        }
        didSet {
            methodChannel?.invokeMethod("setCurrentIndex", arguments: currentIndex, result: { r in
                print("viewId: \(self.viewId) \(r)")
            })
        }
    }
    var methodChannel: FlutterMethodChannel? {
        willSet {
            newValue?.setMethodCallHandler { (call, result) in
                if call.method == "setCurrentIndex" {
                    self.currentIndex = call.arguments as? Int ?? 0
                    result(true)
                }
            }
        }
    }
    
    var indicator: UIView!
    private var indicatorConstraint: Constraint!
    var data: [String]
    var viewId: Int64
    
    init(frame: CGRect, data: [String], viewId: Int64) {
        self.data = data
        self.viewId = viewId
        super.init(frame: frame)
        backgroundColor = .white
        
        var previous: UIButton?
        for (i,item) in data.enumerated() {
            let itemBtn = UIButton(type: .custom)
            itemBtn.tag = 200 + i
            itemBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            itemBtn.setTitle(item, for: .normal)
            itemBtn.setTitleColor(UIColor(hex: 0x222222), for: .normal)
            itemBtn.setTitleColor(UIColor(hex: 0x0A62FF), for: .selected)
            addSubview(itemBtn)
            itemBtn.snp.makeConstraints { make in
                if let previous = previous {
                    make.left.equalTo(previous.snp.right)
                } else {
                    make.left.equalToSuperview()
                }
                make.top.bottom.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(1.0/Double(data.count))
            }
            itemBtn.addTarget(self, action: #selector(onClick(sender:)), for: .touchUpInside)
            
            previous = itemBtn
        }
                
        // 指示器
        indicator = UIView()
        indicator.backgroundColor = UIColor(hex: 0x0A62FF)
        addSubview(indicator)
        indicator.snp.makeConstraints { make in
            self.indicatorConstraint = make.centerX.equalToSuperview().constraint
            make.bottom.equalToSuperview()
            make.size.equalTo(CGSize(width: 87.5, height: 2))
        }
        
        currentIndex = 0
    }
    
    @IBAction func onClick(sender: UIButton) {
        currentIndex = sender.tag - 200
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class NanoSegmentViewFactory: NSObject, FlutterPlatformViewFactory {
    var messenger:FlutterBinaryMessenger
    
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return NanoSegmentPlatformView(frame, viewID: viewId, args: args, messenger: messenger)
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}
