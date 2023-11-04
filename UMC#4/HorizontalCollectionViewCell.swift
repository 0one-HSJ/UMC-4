//
//  HorizontalCollectionViewCell.swift
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    // 이미지뷰
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    // 제목 레이블
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    // 가격 레이블
    let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    // 좋아요 버튼
    let likeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        return button
    }()
    
    // 좋아요 숫자 레이블
    let likeCountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(likeButton)
        addSubview(likeCountLabel)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeCountLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // imageView constraints
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),

            // titleLabel constraints
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),

            // priceLabel constraints
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            // likeButton constraints
            likeButton.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            likeButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),

            // likeCountLabel constraints
            likeCountLabel.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 5),
            likeCountLabel.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
        ])
    }

}

