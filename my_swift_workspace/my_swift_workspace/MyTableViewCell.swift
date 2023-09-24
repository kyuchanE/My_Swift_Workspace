//
//  MyTableViewCell.swift
//  my_swift_workspace
//
//  Created by ChanKyu Hwang on 2023/09/11.
//

import UIKit
import SnapKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    
    let imgView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "invalid_name")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    } ()
    
    let label: UILabel = {
        let l = UILabel()
        l.text = "DEFAULT"
        l.textColor = UIColor.gray
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    } ()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addContentView()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addContentView() {
        contentView.addSubview(imgView)
        contentView.addSubview(label)
    }
    
    private func autoLayout() {
        imgView.snp.makeConstraints { make in
            make.leading.top.equalTo(5)
            make.size.width.height.equalTo(100)
        }
        label.snp.makeConstraints{ make in
            make.leading.equalTo(imgView.snp.trailing).offset(5)
            make.top.equalTo(5)
            make.trailing.equalTo(-5)
        }
    }
    
}
