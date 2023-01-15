//
//  ViewController.swift
//  FirstTableView
//
//  Created by Yerzhan Syzdyk on 10.01.2023.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    private let namesOfProducts : [String] = ["Bread","Milk","CocaCola","pineapple","kiwi","apple","banana","crops","marrow","fish"]
    private let pricesOfProducts : [String] = ["180tg","760tg","450tg","180tg","760tg","450tg","180tg","760tg","450tg","1000tg"]
    
    let myTableView : UITableView = {
        let mytableView = UITableView()
        mytableView.backgroundColor = .systemGray
        mytableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.IDENTIFIER)
        
        return mytableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        setupViews()
        setupConstraints()
    }
    
    

}
//MARK:: TABLE VIEW DATA SOURCE

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        namesOfProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = namesOfProducts[indexPath.row]
        let price = pricesOfProducts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.IDENTIFIER, for: indexPath) as! MyTableViewCell
        cell.setInformation(name: "\(indexPath.row + 1).\(product)", price: price, imageName: product)
        
        //cell.backgroundColor = .systemGray4
        cell.layer.borderWidth = 1
        cell.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return cell
    }
    
}

//MARK:: TABLE VIEW DELEGATE

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}



//MARK:: setup views and constraints

extension ViewController{
    func setupViews(){
        view.addSubview(myTableView)
    }
    
    func setupConstraints(){
        myTableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(15)
        }
    }
}
