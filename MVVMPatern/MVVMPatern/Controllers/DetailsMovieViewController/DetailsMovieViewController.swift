//
//  DetailsMovieViewController.swift
//  MVVMPatern
//
//  Created by Ruslan Liulka on 22.02.2024.
//

import UIKit
import SDWebImage

class DetailsMovieViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //view Model
    var viewModel: DetailsMovieViewModel 
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }

    func configView() {
        self.title = "Movie Details"
        titleLabel.text = viewModel.movieTitle
        descriptionLabel.text = viewModel.movieDescription
        imageView.sd_setImage(with: viewModel.movieImage)
    }

}
