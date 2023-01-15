//
//  MyTableViewCell.swift
//  FirstTableView
//
//  Created by Yerzhan Syzdyk on 10.01.2023.
//

import UIKit
import SnapKit

class MyTableViewCell: UITableViewCell {
    
    static let IDENTIFIER = "MyTableViewCell"
    
    private lazy var myView : UIView = {
        let myView = UIView()
        myView.backgroundColor = .systemCyan
        return myView
    }()
    
    private lazy var myText : UILabel = {
        let myLabel = UILabel()
        myLabel.backgroundColor = .systemCyan
        myLabel.font = UIFont.boldSystemFont(ofSize: 30)
        myLabel.textColor = UIColor.black
        myLabel.textAlignment = .center
        return myLabel
    }()
    
    private lazy var priceOfProduct : UILabel = {
        let myLabel = UILabel()
        myLabel.backgroundColor = .systemCyan
        myLabel.textAlignment = .center
        myLabel.font = UIFont.systemFont(ofSize: 25)
        myLabel.textColor = UIColor.systemYellow
        return myLabel
    }()
    
    private lazy var myImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemCyan
        //imageView.image = UIImage(named: <#T##String#>)
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstrsints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
        
        contentView.backgroundColor = .darkGray
    }
    
    func setInformation(name : String, price : String, imageName : String){
        myText.text = name
        priceOfProduct.text = price
        myImageView.image = UIImage(named: imageName)
    }
    
}

//MARK:: setup views and constraints

extension MyTableViewCell{
    func setupViews(){
        contentView.addSubview(myView)
        myView.addSubview(myText)
        myView.addSubview(priceOfProduct)
        
        contentView.addSubview(myImageView)
        
    }
    
    func setupConstrsints(){
        myView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.trailing.equalToSuperview().multipliedBy(0.7)
        }
        myText.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.5)
        }
        priceOfProduct.snp.makeConstraints { make in
            make.top.equalTo(myText.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        myImageView.snp.makeConstraints { make in
            make.leading.equalTo(myView.snp.trailing)
            make.top.trailing.bottom.equalToSuperview()
        }
    }
}
