//
//  MyTableViewController.swift
//  my_swift_workspace
//
//  Created by ChanKyu Hwang on 2023/09/11.
//

import UIKit
import SnapKit

class MyTableViewController: UIViewController {
    private let myTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        return tv
    } ()
    
    let backButton: UIButton = {
        let b = UIButton()
        b.setTitle("Back", for: .normal)
        b.setTitleColor(.blue, for: .normal)
        return b
    } ()

    let ncButton: UIButton = {
        let b = UIButton()
        b.setTitle("NVC", for: .normal)
        b.setTitleColor(.blue, for: .normal)
        return b
    } ()
    
//    lazy var nvController: UINavigationController = {
//        let nvc = UINavigationController(rootViewController: self)
//        return nvc
//    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        addSubView()
        autoLayout()
    }
}

extension MyTableViewController {
    private func configure() {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.rowHeight = 100
    }
    private func addSubView() {
        view.addSubview(myTableView)
        view.addSubview(backButton)
        view.addSubview(ncButton)
    }
    private func autoLayout() {
        myTableView.snp.makeConstraints{ make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(ncButton.snp.top)
//            make.edges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        backButton.snp.makeConstraints{ make in
            make.bottom.left.equalToSuperview()
            make.right.equalTo(ncButton.snp.left)
            make.size.equalTo(CGSize(width: 200, height: 55))
        }
        ncButton.snp.makeConstraints{ make in
            make.bottom.right.equalToSuperview()
            make.left.equalTo(backButton.snp.right)
            make.size.equalTo(CGSize(width: 200, height: 55))
        }
        
        backButton.addTarget(self, action: #selector(goToBack), for: .touchUpInside)
        ncButton.addTarget(self, action: #selector(goToEmptyView), for: .touchUpInside)
    }
    
    @objc
    func goToBack() {
        self.dismiss(animated: true)
    }
    
    @objc
    func goToEmptyView() {
        let emptyViewController = EmptyViewController()
        self.navigationController?.pushViewController(emptyViewController, animated: true)
    }
}

extension MyTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.imgView.image = UIImage(named: "invalid_name")
        cell.label.text = "test!! : \(indexPath.row)"
        return cell
    }
    
}

extension MyTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click : \(indexPath.row)")
    }
}
