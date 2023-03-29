//
//  ViewController.swift
//  VerticalcardswiperTutorial-iOS
//
//  Created by kimhyungyu on 2021/08/04.
//

import UIKit
import VerticalCardSwiper

class ViewController: UIViewController {

    // MARK: - Properties
    
    var selectedCell: VerticalCardSwiperCell?
    var statusBarShouldBeHidden = false
    //we need to set `View controller-based status bar appearance = YES` in info.plist.
    //so we can be able to hide statusBar.
    override var prefersStatusBarHidden: Bool {
        return statusBarShouldBeHidden
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    private var imageList = [String]()
    private var categoryList = [String]()
    private var titleList = [String]()
    private var subtitleList = [String]()
    private var brandList = [String]()
    
    // MARK: - @IBOutlet Properteis
    
    @IBOutlet weak var cardSwiper: VerticalCardSwiper!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardSwiper.datasource = self
        cardSwiper.delegate = self
        
        cardSwiper.isSideSwipingEnabled = false
        
        cardSwiper.register(nib: UINib(nibName: "VerticalCardSwiperCell", bundle: nil), forCellWithReuseIdentifier: "VerticalCardSwiperCell")
        
        setList()
    }
}

// MARK: - Extensions

extension ViewController {
    private func setList() {
        imageList.append(contentsOf: [ "100",
                                       "200",
                                       "11",
                                       "21",
                                       "31"
        ])
        categoryList.append(contentsOf: [ "가이드북",
                                       "워케이션",
                                       "팔로우 이벤트",
                                       "코워킹 클럽",
                                       "워케이션"
        ])
        brandList.append(contentsOf: [ "NOMAD MAP",
                                       "NOMAD MAP",
                                       "NOMAD MAP",
                                       "NOMAD MAP",
                                       "NOMAD MAP"
        ])
        titleList.append(contentsOf: [ "워케이션\n가이드북",
                                       "아워 워케이션\n통영으로\n다녀왔어요",
                                       "가벼운 노트북\n거치대필요한 분?",
                                       "일요코워킹클럽",
                                       "첫 워케이션을 위한\n강릉 워케이션\n가이드"
        ])
        subtitleList.append(contentsOf: [ "12개 도시 워케이션 AtoZ",
                                       "",
                                       "follw me",
                                       "3월 19일 15시\n세컨드라이브러리",
                                       ""
        ])
    }
    
    private func updateStatusBar(visible: Bool) {
        statusBarShouldBeHidden = !visible
        UIView.animate(withDuration: 0.25) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
}

// MARK: - VerticalCardSwiperDelegate

extension ViewController: VerticalCardSwiperDelegate {
    func didTapCard(verticalCardSwiperView: VerticalCardSwiperView, index: Int) {
        let detailVC = DetailCardViewController()
        
        let cell = cardSwiper.cardForItem(at: index) as? VerticalCardSwiperCell
        selectedCell = cell
        detailVC.dismissClosure = { [weak self] in
            guard let StrongSelf = self else { return }
            StrongSelf.updateStatusBar(visible: true)
        }
        detailVC.backImage = imageList[index]
        updateStatusBar(visible: false)
        present(detailVC, animated: true, completion: nil)
    }
}

// MARK: - VerticalCardSwiperDatasource

extension ViewController: VerticalCardSwiperDatasource {
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return imageList.count
    }

    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        guard let cell =  verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "VerticalCardSwiperCell", for: index) as? VerticalCardSwiperCell else {
            return CardCell()
        }
        cell.initCell(background: imageList[index], brand: brandList[index], category: categoryList[index], title: titleList[index], subtitle: subtitleList[index])
        
        return cell
    }
}
