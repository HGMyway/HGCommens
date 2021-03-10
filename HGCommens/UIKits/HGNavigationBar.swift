//
//  HGNavigationBar.swift
//  TouShi
//
//  Created by 小雨很美 on 2020/12/12.
//  Copyright © 2020 鸡蛋. All rights reserved.
//

import UIKit
import SnapKit

open class HGNavigationBar: UIView {
    
    weak var currentVC: UIViewController?
    let navArea = UIView()
    open var rightButtons: [UIButton]? {
        didSet {
            rightBtnV.arrangedSubviews.forEach { (view) in
                view.removeFromSuperview()
            }
            rightButtons?.forEach({ (view) in
                rightBtnV.addArrangedSubview(view)
            })
        }
    }
    open var leftButtons: [UIButton]? {
        didSet {
            leftBtnV.arrangedSubviews.forEach { (view) in
                view.removeFromSuperview()
            }
            leftButtons?.forEach({ (view) in
                leftBtnV.addArrangedSubview(view)
            })
        }
    }
    open var title: String? {
        set {
            titleLabel.text = newValue
        }
        get {
            return titleLabel.text
        }
    }
    
    open lazy var titleLabel: UILabel = {
        let label = UILabel()
        navArea.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        return label
    }()
    
    private lazy var leftBtnV: UIStackView = {
       let sView = UIStackView()
        sView.axis = .horizontal
        sView.distribution = .equalSpacing
        sView.spacing = 5
        navArea.addSubview(sView)
        sView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(7)
            make.bottom.equalToSuperview().offset(-7)
            make.trailing.lessThanOrEqualToSuperview()
        }
        return sView
    }()
    private lazy var rightBtnV: UIStackView = {
       let sView = UIStackView()
        sView.axis = .horizontal
        sView.distribution = .equalSpacing
        sView.spacing = 5
        navArea.addSubview(sView)
        sView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(7)
            make.bottom.equalToSuperview().offset(-7)
            make.leading.greaterThanOrEqualToSuperview()
        }
        return sView
    }()
    
    private init() {
        super.init(frame: .zero)
    }
    
    public convenience init(_ vc: UIViewController?) {
        self.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.safeAreaInsets.top + 44))
        currentVC = vc
        setNavControlEnable()
        makeUI()
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open func setNavControlEnable() {
        currentVC?.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        currentVC?.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func makeUI() {
        navArea.frame = CGRect(x: 0, y: UIScreen.safeAreaInsets.top, width: UIScreen.main.bounds.width, height: 44)
        addSubview(navArea)
    }
    
    open func addBackButton() -> Self {
        let lBtn = UIButton(type: .custom)
        lBtn.addTarget(self, action: #selector(backAction(_:)), for: .touchUpInside)
        lBtn.setImage(UIImage(named: "fanhui"), for: .normal)
        leftButtons = [lBtn]
        return self
    }
    
    @objc func backAction(_ button: UIButton) {
        currentVC?.navigationController?.popViewController(animated: true)
    }
}

extension HGNavigationBar: UIGestureRecognizerDelegate {
    public override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

