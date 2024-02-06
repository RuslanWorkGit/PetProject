//
//  GenreTableViewCell.swift
//  MyTMDBapp
//
//  Created by Ruslan Liulka on 06.02.2024.
//

import UIKit

class GenreTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreCollectionView: UICollectionView! {
        didSet {
            genreCollectionView.delegate = self
            genreCollectionView.dataSource = self
            genreCollectionView.register(UINib(nibName: "GenreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GenreCollectionViewCell")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
}

extension GenreTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

extension GenreTableViewCell: UICollectionViewDelegate {
    
}
