//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Manjusha Chembra on 24/07/21.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    var newsVM: NewsViewModel? {
        didSet {
            if let newsVM = newsVM {
                titlelabel.text = newsVM.title
                descriptionLabel.text = newsVM.decsription
                let obj = NetworkManager()
                obj.getImage(url: newsVM.urlToImage) { (data) in
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.newsImage.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    var newsImageData: Data? {
        didSet {
            if let data = newsImageData {
                newsImage.image = UIImage(data: data)
            }
        }
    }
    
    private var newsImage: NewsImageView = {
        let v = NewsImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var titlelabel: UILabel = {
        let titLabel = UILabel()
        titLabel.translatesAutoresizingMaskIntoConstraints = false
        titLabel.numberOfLines = 0
        titLabel.font = .systemFont(ofSize: 15, weight: .bold)
        return titLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descLabel = UILabel()
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.textAlignment = .natural
        descLabel.numberOfLines = 0
        descLabel.font = .systemFont(ofSize: 13, weight: .medium)
        descLabel.sizeToFit()
        return descLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(titlelabel)
        addSubview(descriptionLabel)
        addSubview(newsImage)
        setupConstraints()
    }
    
    func setupConstraints() {
        //label title
        NSLayoutConstraint.activate([
            titlelabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titlelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            titlelabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titlelabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -8)
        ])
        
        //description label
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: newsImage.leadingAnchor, constant: 4),
            descriptionLabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 8),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
        
        //news image
        NSLayoutConstraint.activate([
            newsImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            newsImage.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 8),
            newsImage.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12),
            newsImage.heightAnchor.constraint(equalToConstant: 100),
            newsImage.widthAnchor.constraint(equalToConstant: 200),
            
        ])

    }
    
}

