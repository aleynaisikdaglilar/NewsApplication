//
//  DetailImageTableViewCell.swift
//  NewsApp
//
//  Created by Aleyna Isikdaglilar [Tuzel Bankacilik Dijital Squad 1] on 14.11.2022.
//

import UIKit

class DetailImageTableViewCell: UITableViewCell {
    
    static let identifier = "DetailImageTableViewCell"

    let imageViewNews: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "flowers")
        imageView.backgroundColor = .systemRed
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(imageViewNews)
        
//        imageViewNews.widthAnchor.constraint(equalToConstant: 70).isActive = true
//        imageViewNews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
//        imageViewNews.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        //        newsImageView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -10).isActive = true
//        imageViewNews.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6).isActive = true
        
        imageViewNews.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        imageViewNews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        imageViewNews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        imageViewNews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
