//
//  DetailViewController.swift
//  NomardMap
//
//  Created by 정다인 on 2023/03/14.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var paymentLabel: UIButton!
    
    @IBOutlet weak var firstProductImage: UIImageView!
    @IBOutlet weak var secondProductImage: UIImageView!
    @IBOutlet weak var thirdProductImage: UIImageView!
    @IBOutlet weak var fourthProductImage: UIImageView!
    @IBOutlet weak var fifthProductImage: UIImageView!
    @IBOutlet weak var sixthProductImage: UIImageView!
    
    var productData: Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainImageView.image = productData?.productImage
        productNameLabel.text = productData?.productName
        productPriceLabel.text = productData?.productPrice
        
        paymentLabel.layer.cornerRadius = 15
        
        firstProductImage.image = productData?.firstImage
        secondProductImage.image = productData?.secondImage
        thirdProductImage.image = productData?.thirdImage
        fourthProductImage.image = productData?.fourthImage
        fifthProductImage.image = productData?.fifthImage
        sixthProductImage.image = productData?.sixthImage
        
    }
    
    
    @IBAction func paymentButtonTapped(_ sender: UIButton) {
        
        if let url = URL(string: productData!.paymentURL) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
}
