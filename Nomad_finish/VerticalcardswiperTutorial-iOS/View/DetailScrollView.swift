//
//  DetailScrollView.swift
//  VerticalcardswiperTutorial-iOS
//
//  Created by kimhyungyu on 2021/08/08.
//

import UIKit

class DetailScrollView: UIScrollView {
    
    let bgBackView = UIView()
    let imageView = UIImageView()
    let textView = UITextView()
    
    var firstView = UIImageView()
    var secondView = UIImageView()
    var thirdView = UIImageView()
    var forthView = UIImageView()
    var fifthView = UIImageView()
    var sixthVIew = UIImageView()
    
    var paymentButton = UIButton()
   

    override init(frame: CGRect) {
        super.init(frame: frame)
        productImageset()
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        bgBackView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 500)
        bgBackView.layer.masksToBounds = true
        
        imageView.frame = bgBackView.bounds
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        
        let textViewWidth = UIScreen.main.bounds.size.width - 2 * textViewLeftMargin
        let font = UIFont.boldSystemFont(ofSize: 15)
        let textHeight = textViewText.calculateHeightWith(width: textViewWidth, font: font)
        textView.frame = CGRect(x: textViewLeftMargin, y: bgBackView.frame.height + textViewTopMargin, width: textViewWidth, height: textHeight + textViewBottomMargin)
        textView.text = textViewText
        textView.font = font
        textView.textColor = .gray
        
        bgBackView.addSubview(imageView)
        addSubview(bgBackView)
        addSubview(textView)
        addSubview(firstView)
        addSubview(secondView)
        addSubview(thirdView)
        addSubview(forthView)
        addSubview(fifthView)
        addSubview(sixthVIew)
        addSubview(paymentButton)
    
        contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: bgBackView.frame.height + textViewTopMargin + textView.frame.height + textViewBottomMargin + firstView.frame.height + secondView.frame.height + thirdView.frame.height + forthView.frame.height + fifthView.frame.height + sixthVIew.frame.height + 300)
    }
    
    private func productImageset() {
        
        firstView.frame = CGRect(x: 20, y: 950, width: 350, height: 350)
        firstView.isUserInteractionEnabled = true
        firstView.contentMode = .scaleAspectFill
        firstView.image = UIImage(named: "2")
        
        secondView.frame = CGRect(x: 20, y: 1350, width: 350, height: 350)
        secondView.isUserInteractionEnabled = true
        secondView.contentMode = .scaleAspectFill
        secondView.image = UIImage(named: "3")
        
        thirdView.frame = CGRect(x: 20, y: 1750, width: 350, height: 350)
        thirdView.isUserInteractionEnabled = true
        thirdView.contentMode = .scaleAspectFill
        thirdView.image = UIImage(named: "4")
        
        forthView.frame = CGRect(x: 20, y: 2150, width: 350, height: 350)
        forthView.isUserInteractionEnabled = true
        forthView.contentMode = .scaleAspectFill
        forthView.image = UIImage(named: "5")
        
        fifthView.frame = CGRect(x: 20, y: 2550, width: 350, height: 350)
        fifthView.isUserInteractionEnabled = true
        fifthView.contentMode = .scaleAspectFill
        fifthView.image = UIImage(named: "6")
        
        sixthVIew.frame = CGRect(x: 20, y: 2950, width: 350, height: 350)
        sixthVIew.isUserInteractionEnabled = true
        sixthVIew.contentMode = .scaleAspectFill
        sixthVIew.image = UIImage(named: "7")
        //760
        paymentButton.frame = CGRect(x: 20, y: 3350, width: 350, height: 40)
        paymentButton.isUserInteractionEnabled = true
        paymentButton.setTitle("결제하기", for: .normal)
        paymentButton.setTitleColor(.white, for: .normal)
        paymentButton.layer.cornerRadius = 15
        paymentButton.backgroundColor = .green
        paymentButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        paymentButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        
        if let url = URL(string: "https://payapplite.com/l/N1zlMZ") {
            UIApplication.shared.open(url, options: [:])
        }
        
    }

    
    

}


fileprivate let textViewLeftMargin: CGFloat = 20
fileprivate let textViewTopMargin: CGFloat = 40
fileprivate let textViewBottomMargin: CGFloat = 50
fileprivate let textViewText = "오래 기다리셨어요.\n<워케이션 가이드북> 펀딩 마침내 오픈했습니다!\n\n여행 가고 싶은데 일은 해야 하고\n워케이션 해보고 싶어도 막막했다면\n이제는 <워케이션 가이드북>을 믿고 떠나봐요.\n\n워케이션 준비 방법부터 추천 숙소, 일하기 좋은 공간, 주변 맛집까지\n\n노마드맵이 준비한 12개 도시 워케이션 정보를 한 번에 만나보세요.\n\n\n⏰ 펀딩 추가 리워드 \n- 전자책ver 노션링크\n- 워케이션 질문카드\n- 1박 2일 워케이션 티켓 (10개 한정)\n- 워케이션 파트너 전용 내지광고 (3개 한정)"

extension String {
    func calculateHeightWith(width: CGFloat, font: UIFont)-> CGFloat {
        let attr = [NSAttributedString.Key.font: font]
        let maxSize: CGSize = CGSize(width: width, height: CGFloat(MAXFLOAT))
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        return self.boundingRect(with: (maxSize), options: option, attributes: attr, context: nil).size.height
    }
}
