//
//  EmptyViewController.swift
//  my_swift_workspace
//
//  Created by ChanKyu Hwang on 2023/09/20.
//

import UIKit
import SnapKit

class EmptyViewController: UIViewController {
    
    lazy var backView: UIView = {
        let bv = UIView()
        bv.backgroundColor = .white
        return bv
    } ()
    
    lazy var safeArea: UIView = {
        let safeAreaView = UIView()
        safeAreaView.backgroundColor = .white
        return safeAreaView
    } ()
    
    lazy var titleLable: UILabel = {
        let title = UILabel()
        title.text = "Empty"
        return title
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backView)
        view.addSubview(safeArea)
        view.addSubview(titleLable)
        
        backView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            safeArea.snp.makeConstraints { make in
                make.top.bottom.left.right.equalTo(guide)
            }
        } else {
            
        }
        
        titleLable.snp.makeConstraints { make in
            make.center.equalTo(safeArea)
        }
    }
}
