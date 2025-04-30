//
//  CustomCell.swift
//  TestCleanSwift
//
//  Created by Ruslan Liulka on 29.04.2025.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var productImage = UIImageView()
    var productTitlaLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupProductImage()
        setupProductTitle()
        
        setupImageConstraints()
        setupTitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with product: ViewModelProduct) {
        
        productTitlaLabel.text = product.title
        
        if let url = URL(string: product.imageUrl) {
            URLSession.shared.dataTask(with: url) { data, _ , error in
                if let data = data, let imageData = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.productImage.image = imageData
                    }
                }
            }.resume()
        }
    }
    
    private func setupProductImage() {
        productImage.layer.cornerRadius = 10
        productImage.clipsToBounds = true
        addSubview(productImage)
    }
    
    private func setupProductTitle() {
        productTitlaLabel.numberOfLines = 0
        addSubview(productTitlaLabel)
    }
    
    private func setupImageConstraints() {
        productImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            productImage.heightAnchor.constraint(equalToConstant: 80),
            productImage.widthAnchor.constraint(equalTo: productImage.heightAnchor, multiplier: 1)
        ])
    }
    
    private func setupTitleConstraints() {
        productTitlaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productTitlaLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            productTitlaLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
            productTitlaLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    
    
}
