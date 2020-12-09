//
//  LaunchScreenView.swift
//  WebViewApp
//
//  Created by Sanatzhan Aimukambetov on 09.12.2020.
//

import UIKit
import SnapKit

class LaunchScreenView: UIView {
    
    let loadingLabel: UILabel = {
       let ldLabel = UILabel()
        ldLabel.text = "LOADING..."
        ldLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 50)
        ldLabel.textColor = .white
        return ldLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor(red: 38/255, green: 107/255, blue: 243/255, alpha: 1)
        self.addSubview(loadingLabel)
    }
    
    private func setupConstraints() {
        loadingLabel.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
    }

}
