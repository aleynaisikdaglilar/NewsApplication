//
//  CustomTableViewCell.swift
//  NewsApp
//
//  Created by Aleyna Isikdaglilar [Tuzel Bankacilik Dijital Squad 1] on 25.10.2022.
//

import UIKit


var articles = [Article]()

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10.0
        stackView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        stackView.layer.shadowColor = UIColor.black.cgColor
        stackView.layer.shadowOpacity = 0.3
        stackView.layer.shadowRadius = 6
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    let stackViewInside: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10.0
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sub"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
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
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date"
        label.font = UIFont(name: "Helvetica", size: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private let parentView: UIView = {
        let cardView = UIView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.3
        cardView.layer.shadowRadius = 6
        cardView.layer.cornerRadius = 10
        cardView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        return cardView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        stackViewInside.addArrangedSubview(titleLabel)
        stackViewInside.addArrangedSubview(descriptionTitleLabel)
        stackViewInside.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(stackViewInside)
        stackView.addArrangedSubview(imageViewNews)
        
        contentView.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        imageViewNews.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageViewNews.setContentCompressionResistancePriority(.defaultLow - 1, for: .vertical)
        imageViewNews.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //    func configure(with viewModel: CustomTableViewCellViewModel){
    //        newsTitleLabel.text = viewModel.title
    //        subTitleLabel.text = viewModel.subTitle
    //
    //        if let data = viewModel.imageData{
    //            newsImageView.image = UIImage(data: data)
    //        } else {
    //
    //        }
    //    }
    
}
