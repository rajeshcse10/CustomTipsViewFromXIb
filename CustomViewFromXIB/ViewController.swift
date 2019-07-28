//
//  ViewController.swift
//  CustomViewFromXIB
//
//  Created by Rajesh Karmaker on 28/7/19.
//  Copyright © 2019 Rajesh Karmaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipsContainerView: UIView!
    var tipsView:TipsView?
    @IBOutlet weak var tipsViewHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTipsView()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if tipsViewHeightConstraint.constant == 0{
            return
        }
        tipsView?.adjustFrame()
    }
    func setUpTipsView() {
        let tFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 20, height: tipsViewHeightConstraint.constant)
        tipsView = TipsView(frame: tFrame)
        tipsView!.delegate  = self
        tipsContainerView.addSubview(tipsView!)
        
    }
}

extension ViewController:HeightConstraintProtocol{
    func setTipsViewHeight(_ height: CGFloat) {
        tipsViewHeightConstraint.constant = height
    }
}
