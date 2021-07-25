//
//  NewsImageView.swift
//  NewsApp
//
//  Created by Manjusha Chembra on 24/07/21.
//

import UIKit

class NewsImageView: UIView {
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    private lazy var imageView: UIImageView = {
       let newsImage = UIImageView()
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        newsImage.contentMode = .scaleAspectFill
        newsImage.layer.cornerRadius = 20
        newsImage.clipsToBounds = true
        return newsImage
    }()
    
    private lazy var baseview: UIView = {
        let shadowBaseView = UIView()
        shadowBaseView.backgroundColor = .clear
        shadowBaseView.translatesAutoresizingMaskIntoConstraints = false
        shadowBaseView.layer.shadowColor = UIColor.black.cgColor
        shadowBaseView.layer.shadowOffset = CGSize(width: 5, height: 5)
        shadowBaseView.layer.shadowOpacity = 0.7
        shadowBaseView.layer.shadowRadius = 10.0
        return shadowBaseView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(baseview)
        baseview.addSubview(imageView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        [baseview, imageView].forEach { (v) in
            NSLayoutConstraint.activate([
                v.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                v.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                v.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                v.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        baseview.layer.shadowPath = UIBezierPath(roundedRect: baseview.bounds, cornerRadius: 10).cgPath
        baseview.layer.shouldRasterize = true
        baseview.layer.rasterizationScale = UIScreen.main.scale
    }
    
}
