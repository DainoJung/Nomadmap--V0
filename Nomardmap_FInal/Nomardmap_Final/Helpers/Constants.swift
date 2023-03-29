//
//  Constants.swift
//  Nomardmap_FInal
//
//  Created by 정다인 on 2023/03/19.
//

import UIKit

// 사용하게될 Cell 문자열 묶음
public struct Cell {
    static let productCellIdentifier = "ProductCell"
    static let productCollectionViewCellIdentifier = "ProrductCollectionViewCell"
    private init() {}
}



// 컬렉션뷰 구성을 위한 설정
public struct CVCell {
    static let spacingWitdh: CGFloat = 1
    static let cellColumns: CGFloat = 3
    private init() {}
}
