//
//  TipsView.swift
//  CustomViewFromXIB
//
//  Created by Rajesh Karmaker on 28/7/19.
//  Copyright © 2019 Rajesh Karmaker. All rights reserved.
//

import UIKit
protocol HeightConstraintProtocol:class {
    func setTipsViewHeight(_ height:CGFloat)
}
class TipsView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var nibView:UIView?
    
    weak var delegate:HeightConstraintProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
        nibView = Bundle.main.loadNibNamed("TipsView", owner: self, options: nil)?[0] as? UIView
        
        textSet()
        
        addSubview(nibView!)
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        var frameRect = contentView.bounds
//        frameRect.size = CGSize(width: self.bounds.size.width, height: contentView.bounds.height)
//        nibView!.frame = frameRect
//        frame = frameRect
//        adjustFrame()
//    }
    func textSet() {
        titleLabel.text = "TIPS"
        descriptionLabel.text = "In the next two lines, we positioned the content view to take up the entire view’s appearance. There are a myriad of ways to accomplish this, and this probably isn’t the best pattern, but it’s quick and easy, and only two lines of code."
    }
    func adjustFrame(){
        var frameRect = contentView.bounds
        frameRect.size = CGSize(width: self.bounds.size.width, height: contentView.bounds.height)
        nibView!.frame = frameRect
        frame = frameRect
        delegate?.setTipsViewHeight(self.bounds.size.height)
    }
    @IBAction func closeAction(_ sender: UIButton) {
        delegate?.setTipsViewHeight(0)
    }
}
