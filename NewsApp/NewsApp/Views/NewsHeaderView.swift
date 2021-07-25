//
//  NewsHeaderView.swift
//  NewsApp
//
//  Created by Manjusha Chembra on 24/07/21.
//

import UIKit

final class NewsHeaderView: UIView {
    private var fontSize: CGFloat
    
    private lazy var heaingLabel: UILabel = {
        let headingLabel = UILabel()
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        headingLabel.text = "News"
        headingLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
        return headingLabel
    }()
    
    init(fontSize: CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    private lazy var subheadlineLabel: UILabel = {
        let subHeadingLabel = UILabel()
        subHeadingLabel.translatesAutoresizingMaskIntoConstraints = false
        subHeadingLabel.font = subHeadingLabel.font.withSize(fontSize)
        subHeadingLabel.text = "Top Headlines"
        subHeadingLabel.textColor = .gray
        return subHeadingLabel
        
    }()
    
    private lazy var headerStackView: UIStackView = {
        let headerStack = UIStackView(arrangedSubviews: [heaingLabel])
        headerStack.translatesAutoresizingMaskIntoConstraints = false
        headerStack.axis = .horizontal
        return headerStack
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupView() {
        addSubview(headerStackView)
        addSubview(subheadlineLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            subheadlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subheadlineLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 8),
            subheadlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}
