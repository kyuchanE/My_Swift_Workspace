//
//  ViewController.swift
//  my_swift_workspace
//
//  Created by ChanKyu Hwang on 2023/09/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var redView = UIView()
    var orangeView = UIView()
    var yellowView = UIView()
    var greenView = UIView()
    var blueView = UIView()
    var indigoView = UIView()
    var purpleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(redView)
        self.view.addSubview(orangeView)
        self.view.addSubview(yellowView)
        self.view.addSubview(greenView)
        self.view.addSubview(blueView)
        self.view.addSubview(indigoView)
        self.view.addSubview(purpleView)
        
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        indigoView.backgroundColor = .systemIndigo
        purpleView.backgroundColor = .purple
        
        redView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.size.width.height.equalTo(100)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
        
        orangeView.snp.makeConstraints { make in
            make.top.equalTo(redView.snp.bottom)
            make.size.width.height.equalTo(100)
            make.left.equalTo(view.snp.left)
        }
        
        yellowView.snp.makeConstraints{ make in
            make.top.equalTo(orangeView.snp.bottom)
            make.size.equalTo(CGSize(width: 100, height: 200))
            make.left.equalTo(view.snp.left)
        }
    }


}

