//
//  HGSegmentedControl.swift
//  HGCommens
//
//  Created by 小雨很美 on 2020/12/14.
//

import UIKit

open class HGSegmentedControl: UIView {
    
    
    open var currentIndex = 0
    open var selectBGInset = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: -10)
    open var bgColor: UIColor? {
        didSet {
            bgView.backgroundColor = bgColor
        }
    }
    
    open var selectBGColor: UIColor? {
        didSet {
            selectBG.backgroundColor = selectBGColor
            contentView.arrangedSubviews.forEach { (view) in
                let btn = view as? UIButton
                btn?.setTitleColor(selectBGColor ?? UIColor.orange, for: .normal)
            }
        }
    }
    
    open var items: [String]? {
        didSet {
            contentView.arrangedSubviews.forEach { (view) in
                view.removeFromSuperview()
            }
            items?.enumerated().forEach({ (item) in
                let btn = UIButton(type: .custom)
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                btn.setTitle(item.element, for: .normal)
                btn.setTitleColor(.white, for: .selected)
                btn.setTitleColor(selectBGColor ?? UIColor.orange, for: .normal)
                btn.addTarget(self, action: #selector(clickAction(_:)), for: .touchUpInside)
                btn.tag = item.offset
                contentView.addArrangedSubview(btn)
            })
            setCurrentIndex(0, animate: false)
        }
    }
    
    open var selectBackBlock: ((_ index: Int) -> Void)?
    
    public convenience init(items: [String]? = nil, selectBackBlock: ((_ index: Int) -> Void)? = nil) {
        self.init(frame:.zero)
        makeUI()
        self.items = items
        self.selectBackBlock = selectBackBlock
        
    }
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    lazy var selectBG: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = .orange
        return view
    }()
    public lazy var contentView: UIStackView = {
       let sView = UIStackView()
        sView.spacing = 20
        sView.axis = .horizontal
        sView.alignment = .center
        sView.distribution = .fillEqually
        addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        addSubview(selectBG)
        addSubview(sView)
        sView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        }
        return sView
    }()
    
    func makeUI() {
    }
    
    func setCurrentIndex(_ index: Int, animate: Bool = true) {
        currentIndex = index
        guard let btns = contentView.arrangedSubviews as? [UIButton] else {
            return
        }
        btns.forEach { (btn) in
            btn.isSelected = false
        }
        btns[index].isSelected = true
        
        let du = animate ? 0.2 : 0
        UIView.animate(withDuration: du) {
            self.selectBG.snp.remakeConstraints { (make) in
                make.edges.equalTo(self.contentView.arrangedSubviews[self.currentIndex]).inset(self.selectBGInset)
            }
            self.layoutIfNeeded()
        }
    }
    
    @objc func clickAction(_ button: UIButton) {
        guard button.isSelected == false else {
            return
        }
        setCurrentIndex(button.tag)
        selectBackBlock?(button.tag)
    }
    
    
}
