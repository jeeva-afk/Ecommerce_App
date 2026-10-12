//
//  ProductDetailViewController.swift
//  E-Commerce App
//
//  Created by Jeeva K on 01/05/26.
//
import UIKit

class ProductDetailsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    
    // MARK: - Data
    var watch: WatchEntity?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureData()
    }
    
    // MARK: - Setup UI
    func setupUI() {
        
        productImageView.layer.cornerRadius = 20
        productImageView.clipsToBounds = true
        productImageView.contentMode = .scaleAspectFit
        
        favoriteButton.layer.cornerRadius = 25
        favoriteButton.backgroundColor = .lightGray
        
        addToCartButton.layer.cornerRadius = 10
        addToCartButton.backgroundColor = .systemBlue
        addToCartButton.setTitleColor(.white, for: .normal)
    }
    
    // MARK: - Set Data
    func configureData() {

        guard let watch = watch else { return }

        nameLabel.text = watch.name
        priceLabel.text = watch.price
        descriptionLabel.text = watch.watchdescription

        if let imageName = watch.image {
            productImageView.image = UIImage(systemName: imageName)
        }
    }
    // MARK: - Actions
    @IBAction func favoriteTapped(_ sender: UIButton) {
        sender.tintColor = .red
        print("Added to favorites ❤️")
    }
    
    @IBAction func addToCartTapped(_ sender: UIButton) {
        print("Added to cart 🛒")
    }
}
