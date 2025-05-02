////
////  CustomCell.swift
////  TestCleanSwift
////
////  Created by Ruslan Liulka on 29.04.2025.
////
//
import UIKit
//
//class CustomCell: UITableViewCell {
//
//    var productImage = UIImageView()
//    var productTitlaLabel = UILabel()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        self.setupProductImage()
//        self.setupProductTitle()
//
//        self.setupImageConstraints()
//        setupTitleConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
////    func configure(with product: ViewModelProduct) {
////
////        productTitlaLabel.text = product.title
////
////        if let url = URL(string: product.imageUrl) {
////            URLSession.shared.dataTask(with: url) { data, _ , error in
////                if let data = data, let imageData = UIImage(data: data) {
////                    DispatchQueue.main.async {
////                        self.productImage.image = imageData
////                    }
////                }
////            }.resume()
////        }
////    }
//
////    func configure(with product: ViewModelProduct) {
////        DispatchQueue.main.async {
////            self.productTitlaLabel.text = product.title
////            self.productImage.image = nil // щоб не мерехтіло під час повторного використання
////        }
////
////        if let url = URL(string: product.imageUrl) {
////            URLSession.shared.dataTask(with: url) { data, _, _ in
////                if let data = data, let image = UIImage(data: data) {
////                    DispatchQueue.main.async {
////                        self.productImage.image = image
////                    }
////                }
////            }.resume()
////        }
////    }
//
//    func configure(with product: ViewModelProduct) {
//        DispatchQueue.main.async {
//            self.productTitlaLabel.text = product.title
//            self.productImage.image = nil
//        }
//
//        guard let url = URL(string: product.imageUrl) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, _ in
//            if let data = data, let image = UIImage(data: data) {
//                DispatchQueue.main.async {
//                    self.productImage.image = image
//                }
//            }
//        }.resume()
//    }
//
//
//
//    private func setupProductImage() {
//        productImage.layer.cornerRadius = 10
//        productImage.clipsToBounds = true
//        addSubview(productImage)
//    }
//
//    private func setupProductTitle() {
//        productTitlaLabel.numberOfLines = 0
//        addSubview(productTitlaLabel)
//    }
//
//    private func setupImageConstraints() {
//        productImage.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            productImage.centerYAnchor.constraint(equalTo: centerYAnchor),
//            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//            productImage.heightAnchor.constraint(equalToConstant: 80),
//            productImage.widthAnchor.constraint(equalTo: productImage.heightAnchor, multiplier: 1)
//        ])
//    }
//
//    private func setupTitleConstraints() {
//        productTitlaLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            productTitlaLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//            productTitlaLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
//            productTitlaLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
//        ])
//    }
//
//
//
//}
//
//class CustomCell: UITableViewCell {
//
//    private let productImage = UIImageView()
//    private let productTitleLabel = UILabel()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        setupProductImage()
//        setupProductTitle()
//        setupConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func configure(with product: ViewModelProduct) {
//        // 🧼 Гарантовано на main потоці:
//        productTitleLabel.text = product.title
//        productImage.image = nil
//
//        guard let url = URL(string: product.imageUrl) else { return }
//
//        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
//            guard let self = self, let data = data, let image = UIImage(data: data) else { return }
//            DispatchQueue.main.async {
//                self.productImage.image = image
//            }
//        }.resume()
//    }
//
//    private func setupProductImage() {
//        productImage.layer.cornerRadius = 10
//        productImage.clipsToBounds = true
//        productImage.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(productImage)
//    }
//
//    private func setupProductTitle() {
//        productTitleLabel.numberOfLines = 0
//        productTitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(productTitleLabel)
//    }
//
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            productImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            productImage.heightAnchor.constraint(equalToConstant: 80),
//            productImage.widthAnchor.constraint(equalTo: productImage.heightAnchor),
//
//            productTitleLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
//            productTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
//            productTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
//        ])
//    }
//}


//
//  CustomCell.swift
//  TestTaskCleanSwift
//
//  Created by Ruslan Liulka on 26.04.2025.
//



class CustomCell: UITableViewCell {
    
    var characterImageView = UIImageView()
    var characterNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(characterImageView)
        addSubview(characterNameLabel)
        
        configureImageView()
        configureNameLable()
        setImageConstraints()
        setNameLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not benn implemented")
    }
    
    func configure(with chardacter: CharacterList.CharacterDisplay) {
        characterNameLabel.text = chardacter.name
        
        let urlString = chardacter.imageURL
        if let url = URL(string: urlString) {
            
            URLSession.shared.dataTask(with: url) { data, _ , error in
                if let data = data, let imageData = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.characterImageView.image = imageData
                    }
                }
            }.resume()
            
        }
        
    }
    
    func configureImageView() {
        characterImageView.contentMode = .scaleToFill
        characterImageView.layer.cornerRadius = 10
        characterImageView.clipsToBounds = true
        
    }
    
    func configureNameLable() {
        characterNameLabel.numberOfLines = 0
        characterNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            characterImageView.heightAnchor.constraint(equalToConstant: 80),
            characterImageView.widthAnchor.constraint(equalTo: characterImageView.heightAnchor, multiplier: 4/3)
        ])
    }
    
    func setNameLabelConstraints() {
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20),
            characterNameLabel.heightAnchor.constraint(equalToConstant: 80),
            characterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
}
