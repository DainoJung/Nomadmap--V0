//
//  ViewController.swift
//  Nomardmp3
//
//  Created by 정다인 on 2023/03/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var productArray: [Product] = [
        Product(productImage: UIImage(named: "1.png"), productName: "디어먼데이 통영", productDescription: "1층부터 4층까지 구경해요"),
    Product(productImage: UIImage(named: "book_1.png"), productName: "워케이션 가이드북", productDescription: "12개 도시 워케이션 AtoZ")
    ]
 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //tableView.rowHeight = 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        let product = productArray[indexPath.row]
        
        cell.mainImageView.image = product.productImage
        cell.productNameLabel.text = product.productName
        cell.descriptionLabel.text = product.productDescription
        
        return cell
    }


}

