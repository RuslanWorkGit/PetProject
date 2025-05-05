//
//  CustomCell.swift
//  CleanSwiftTest
//
//  Created by Ruslan Liulka on 03.05.2025.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var characterImage = UIImageView()
    var characterName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(characterName)
        contentView.addSubview(characterImage)
        
        setupName()
        setupImage()
        constraintImage()
        constraintName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with character: CharacterViewModel) {
        characterName.text = character.name
        
        //if let url = URL(string: character.)
    }
    
    private func setupImage() {
        characterImage.layer.cornerRadius = 10
        characterImage.clipsToBounds = true
        
    }
    
    private func setupName() {
        characterName.numberOfLines = 0
        characterName.adjustsFontSizeToFitWidth = true
    }
    
    private func constraintImage() {
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            characterImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            characterImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            characterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            characterImage.heightAnchor.constraint(equalToConstant: 80),
            characterImage.widthAnchor.constraint(equalTo: characterImage.heightAnchor)
        ])
    }
    
    private func constraintName() {
        characterName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterName.centerYAnchor.constraint(equalTo: centerYAnchor),
            characterName.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 12),
            characterName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 12)
        ])
    }
}
