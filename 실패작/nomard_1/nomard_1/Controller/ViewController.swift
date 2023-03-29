//
//  ViewController.swift
//  nomard_1
//
//  Created by 정다인 on 2023/03/20.
//

import UIKit

class ViewController: UIViewController {
    
    var list = [
        Product(productImage: UIImage(named: "01.png"), productName: "디어먼데이 통영", productDescription: "1층부터 4층까지 구경해요", productPrice: "5000원", paymentURL: "https://payapplite.com/l/zmgBPj", firstImage: UIImage(named: "02.png"), secondImage: UIImage(named: "03.png"), thirdImage: UIImage(named: "04.png"), fourthImage: UIImage(named: "05.png"), fifthImage: UIImage(named: "06.png"), sixthImage: UIImage(named: "07.png")),
        
        Product(productImage: UIImage(named: "1.png"), productName: "워케이션 가이드북", productDescription: "12개 도시 워케이션 AtoZ",productPrice: "25,800원", paymentURL: "https://payapplite.com/l/N1zlMZ", firstImage: UIImage(named: "2.png"), secondImage: UIImage(named: "3.png"), thirdImage: UIImage(named: "4.png"), fourthImage: UIImage(named: "5.png"), fifthImage: UIImage(named: "6.png"), sixthImage: UIImage(named: "7.png"))
    ]
    
    @IBOutlet var collectionView: UICollectionView!
    let flowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
    func setupCollectionView() {
        // 컬렉션뷰의 레이아웃을 담당하는 객체
        //let flowLayout = UICollectionViewFlowLayout()
        
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        // 컬렉션뷰의 스크롤 방향 설정
        flowLayout.scrollDirection = .vertical
        
        let collectionCellWidth = (UIScreen.main.bounds.width - CVCell.spacingWitdh * (CVCell.cellColumns - 1)) / CVCell.cellColumns
        
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        // 아이템 사이 간격 설정
        flowLayout.minimumInteritemSpacing = CVCell.spacingWitdh
        // 아이템 위아래 사이 간격 설정
        flowLayout.minimumLineSpacing = CVCell.spacingWitdh
        
        // 컬렉션뷰의 속성에 할당
        collectionView.collectionViewLayout = flowLayout
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CSCollectionViewCell
        
        cell.mainImageView.image = list[indexPath.row].productImage
        
        return cell
    }

    private func collectionView(_ collectionView: UICollectionView, didSelectRowAt indexPath: IndexPath) {
        // 세그웨이를 실행
        performSegue(withIdentifier: "toDetail", sender: indexPath.item)
        print("제바라")
    }

    // prepare세그웨이(데이터 전달)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            let index = sender as! IndexPath

            // 배열에서 아이템을 꺼내서, 다음화면으로 전달
            detailVC.productData = list[index.row]
        }
    }
}

//extension ViewController: UICollectionViewDelegateFlowLayout {
//
//    // 위 아래 간격
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 100
//    }
//
//    // 옆 간격
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 100
//    }
//
//    // cell 사이즈
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width = collectionView.frame.width // 3 - 1 ///  3등분하여 배치, 옆 간격이 1이므로 1을 빼줌
//        let size = CGSize(width: width, height: width)
//        return size
//    }
//
//
//}
