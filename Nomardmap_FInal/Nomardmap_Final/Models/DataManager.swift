//
//  DataManager.swift
//  Nomardmap_FInal
//
//  Created by 정다인 on 2023/03/19.
//

import UIKit

class DataManager {
    private var productDataArray: [Product] = []
    
    func makeProductData() {
        productDataArray = [
            
            Product(productImage: UIImage(named: "01.png"), productName: "디어먼데이 통영", productDescription: "1층부터 4층까지 구경해요", productPrice: "5000원", paymentURL: "https://payapplite.com/l/zmgBPj", firstImage: UIImage(named: "02.png"), secondImage: UIImage(named: "03.png"), thirdImage: UIImage(named: "04.png"), fourthImage: UIImage(named: "05.png"), fifthImage: UIImage(named: "06.png"), sixthImage: UIImage(named: "07.png")),
            
            Product(productImage: UIImage(named: "1.png"), productName: "워케이션 가이드북", productDescription: "12개 도시 워케이션 AtoZ",productPrice: "25,800원", paymentURL: "https://payapplite.com/l/N1zlMZ", firstImage: UIImage(named: "2.png"), secondImage: UIImage(named: "3.png"), thirdImage: UIImage(named: "4.png"), fourthImage: UIImage(named: "5.png"), fifthImage: UIImage(named: "6.png"), sixthImage: UIImage(named: "7.png"))
        ]
    }
    
    func getProductData() -> [Product] {
        return productDataArray
    }
    
    
}
