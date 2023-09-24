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
    let imgView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "invalid_name")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    lazy var myButton: UIButton = {
        let b = UIButton()
        b.setTitle("VC", for: .normal)
        b.setTitleColor(.blue, for: .normal)
        return b
    } ()
    lazy var nvcButton: UIButton = {
        let b = UIButton()
        b.setTitle("NVC", for: .normal)
        b.setTitleColor(.blue, for: .normal)
        return b
    } ()
    
    let safeArea: UIView = {
        let safeAreaView =  UIView()
        safeAreaView.backgroundColor = .white
        return safeAreaView
    } ()
  
    // TODO: chan 스토리보드가 존재하기 때문에 안되는건가?
//    let navigationController = UINavigationController(rootViewController: ViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(safeArea)
        self.view.addSubview(redView)
        self.view.addSubview(orangeView)
        self.view.addSubview(yellowView)
        self.view.addSubview(greenView)
        self.view.addSubview(blueView)
        self.view.addSubview(indigoView)
        self.view.addSubview(purpleView)
        self.view.addSubview(imgView)
        self.view.addSubview(myButton)
        self.view.addSubview(nvcButton)
        
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        indigoView.backgroundColor = .systemIndigo
        purpleView.backgroundColor = .purple
        
        myButton.backgroundColor = .systemPink
        nvcButton.backgroundColor = .systemOrange
        
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            safeArea.snp.makeConstraints{ make in
                make.top.bottom.left.right.equalTo(guide)
            }
        } else {
            
        }
        
        redView.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top)
            make.size.height.equalTo(100)
            make.left.equalTo(safeArea.snp.left).offset(50)
            make.right.equalTo(safeArea.snp.right).offset(-50)
        }
        
        orangeView.snp.makeConstraints { make in
            make.top.equalTo(redView.snp.bottom)
            make.size.width.height.equalTo(100)
            make.left.equalTo(safeArea.snp.left)
        }
        
        yellowView.snp.makeConstraints{ make in
            make.top.equalTo(orangeView.snp.bottom)
            make.size.equalTo(CGSize(width: 100, height: 200))
            make.left.equalTo(safeArea.snp.left)
        }
        
        imgView.snp.makeConstraints{ make in
            make.top.equalTo(orangeView.snp.bottom)
            make.left.equalTo(yellowView.snp.right)
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
        
        myButton.snp.makeConstraints{ make in
            make.bottom.leading.equalTo(safeArea)
            make.trailing.equalTo(nvcButton.snp.leading)
            make.size.equalTo(CGSize(width: 200, height: 55))
        }
        nvcButton.snp.makeConstraints{ make in
            make.bottom.trailing.equalTo(safeArea)
            make.leading.equalTo(myButton.snp.trailing)
            make.size.equalTo(CGSize(width: 200, height: 55))
        }
        
        myButton.addTarget(self, action: #selector(onTabButton), for: .touchUpInside)
    }

    @objc
    func onTabButton() {
        let myTableVC = MyTableViewController()
        let nc = UINavigationController(rootViewController: myTableVC)
        nc.modalPresentationStyle = .fullScreen
        self.present(nc, animated: true, completion: nil)
//        self.navigationController?.pushViewController(MyTableViewController(), animated: true)
    }
}

