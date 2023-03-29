//
//  ViewController.swift
//  NomardMap
//
//  Created by 정다인 on 2023/03/14.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let flowLayout = UICollectionViewFlowLayout()
    var productArray: [Product] = []
    var productDataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setupDatas()
        //self.collectionView.collectionViewLayout = c
    }
    
    func setCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupDatas() {
        productDataManager.makeProductData()
        productArray = productDataManager.getProductData()
    }
    
    func setupCollectionView() {
        
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 200, height: 200)
        // 아이템 사이 간격 설정
        flowLayout.minimumInteritemSpacing = 3
        // 아이템 위아래 사이 간격 설정
        flowLayout.minimumLineSpacing = 3
        collectionView.collectionViewLayout = flowLayout
        
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        let product = productArray[indexPath.item]
        
        cell.mainImageView.image = product.productImage
        cell.productNameLabel.text = product.productName
        cell.descriptionLabel.text = product.productDescription
        
        return cell
    }
    

    
}



