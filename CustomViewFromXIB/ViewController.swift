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
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewHolder: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTipsView()
        setUpCollectionView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
    func setUpCollectionView(){
        mCollectionView.delegate = self
        mCollectionView.dataSource = self
        let nib = UINib(nibName: "HCollectionViewCell", bundle: nil)
        mCollectionView.register(nib, forCellWithReuseIdentifier: "HCollectionViewCell")
        
    }
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HCollectionViewCell", for: indexPath) as! HCollectionViewCell
        cell.titleLabel.text = "Mixed salad"
        return cell
    }
    
    
}
extension ViewController:HeightConstraintProtocol{
    func setTipsViewHeight(_ height: CGFloat) {
        tipsViewHeightConstraint.constant = height
    }
}

