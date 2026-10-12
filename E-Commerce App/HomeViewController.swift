//
//  HomeViewController.swift
//  E-Commerce App
//
//  Created by Jeeva K on 01/05/26.
//


import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var watchCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
   
    // MARK: - Data Models
    struct Watch {
        let name: String
        let price: String
        let image: String
        let category: String
        let description: String
    }
    var selectedWatch: WatchEntity?
    
    let categories = ["All", "Luxury", "Digital", "Smart", "Casual"]
    
    var watches: [Watch] = [
        
        Watch(name: "Rolex Submariner",
              price: "$7500",
              image: "clock",
              category: "Luxury",
              description: "Premium Swiss diving watch with waterproof stainless steel body and sapphire crystal glass."),
        
        Watch(name: "Casio Digital",
              price: "$120",
              image: "timer",
              category: "Digital",
              description: "Affordable digital watch with alarm, stopwatch, and long battery life."),
        
        Watch(name: "Apple Watch Series",
              price: "$399",
              image: "applewatch",
              category: "Smart",
              description: "Smartwatch with fitness tracking, heart rate monitor, and notifications."),
        
        Watch(name: "Titan Classic",
              price: "$250",
              image: "clock.fill",
              category: "Casual",
              description: "Elegant everyday watch with a clean dial and durable leather strap."),
        
        Watch(name: "Fossil Gen 5",
              price: "$180",
              image: "stopwatch",
              category: "Casual",
              description: "Stylish smartwatch with Wear OS, GPS, and heart tracking features."),
        
        Watch(name: "Omega Seamaster",
              price: "$6200",
              image: "clock",
              category: "Luxury",
              description: "Luxury diving watch with precision movement and professional water resistance."),
        
        Watch(name: "Seiko 5",
              price: "$220",
              image: "clock.fill",
              category: "Casual",
              description: "Reliable automatic watch with classic design and strong durability."),
        
        Watch(name: "Garmin Fenix 7",
              price: "$899",
              image: "applewatch",
              category: "Smart",
              description: "Advanced fitness smartwatch with GPS, mapping, and sports tracking."),
        
        Watch(name: "Hublot Big Bang",
              price: "$9500",
              image: "clock",
              category: "Luxury",
              description: "Luxury sports watch with bold design and premium Swiss craftsmanship."),
        
        Watch(name: "Noise ColorFit",
              price: "$60",
              image: "applewatch",
              category: "Smart",
              description: "Budget smartwatch with fitness tracking and notification alerts."),
        
        Watch(name: "Fastrack Reflex",
              price: "$80",
              image: "stopwatch",
              category: "Digital",
              description: "Stylish digital watch with fitness tracking and smart notifications."),
        
        Watch(name: "Sonata Classic",
              price: "$50",
              image: "clock",
              category: "Casual",
              description: "Simple and elegant watch designed for everyday wear."),
        
        Watch(name: "Tag Heuer Carrera",
              price: "$4200",
              image: "clock.fill",
              category: "Luxury",
              description: "Luxury racing-inspired watch with precision chronograph functions."),
        
        Watch(name: "Samsung Galaxy Watch",
              price: "$329",
              image: "applewatch",
              category: "Smart",
              description: "Smartwatch with AMOLED display and advanced health tracking."),
        
        Watch(name: "Timex Expedition",
              price: "$110",
              image: "clock",
              category: "Casual",
              description: "Rugged outdoor watch built for adventure and durability."),
        
        Watch(name: "Michael Kors Runway",
              price: "$350",
              image: "clock.fill",
              category: "Luxury",
              description: "Fashion luxury watch with modern design and stainless steel finish."),
        
        Watch(name: "Realme Watch 3",
              price: "$70",
              image: "applewatch",
              category: "Smart",
              description: "Affordable smartwatch with Bluetooth calling and fitness tracking."),
        
        Watch(name: "Citizen Eco-Drive",
              price: "$280",
              image: "clock",
              category: "Casual",
              description: "Solar-powered watch with no battery replacement needed."),
        
        Watch(name: "Noise Pro 2",
              price: "$90",
              image: "applewatch",
              category: "Smart",
              description: "Feature-rich smartwatch with SpO2 monitoring and sports modes."),
        
        Watch(name: "Rado True Square",
              price: "$4800",
              image: "clock.fill",
              category: "Luxury",
              description: "Luxury ceramic watch with scratch-resistant premium finish.")
    ]
    
    var filteredWatches: [Watch] = []
    var selectedCategory: String = "All"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup
        filteredWatches = watches
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        watchCollectionView.delegate = self
        watchCollectionView.dataSource = self
        
        searchBar.delegate = self
        
        setupLayouts()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toProduct" {
            
            let destination = segue.destination as! ProductDetailsViewController
            
            destination.watch = selectedWatch
        }
    }
}

// MARK: - CollectionView Layout
extension HomeViewController {
    
    func setupLayouts() {
        
        // =========================
        // 🟦 WATCH COLLECTION VIEW
        // =========================
        let watchLayout = UICollectionViewFlowLayout()
        
        let padding: CGFloat = 10
        let width = (view.frame.width - (padding * 3)) / 2
        
        watchLayout.itemSize = CGSize(width: width, height: 180)
        watchLayout.minimumLineSpacing = padding
        watchLayout.minimumInteritemSpacing = padding
        
        watchLayout.scrollDirection = .vertical
        
        watchCollectionView.collectionViewLayout = watchLayout
        
        // =========================
        // 🟩 CATEGORY COLLECTION VIEW
        // =========================
        let categoryLayout = UICollectionViewFlowLayout()
        
        categoryLayout.scrollDirection = .horizontal
        
        categoryLayout.itemSize = CGSize(width: 120, height: 35)
        
        categoryLayout.minimumLineSpacing = 12
        categoryLayout.minimumInteritemSpacing = 12
        
        categoryLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        categoryCollectionView.collectionViewLayout = categoryLayout
        
        categoryCollectionView.showsHorizontalScrollIndicator = false
    }
}

// MARK: - CollectionView DataSource
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // Categories + Watches count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == categoryCollectionView ? categories.count : filteredWatches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoryCollectionView {
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "CategoryCell",
                for: indexPath
            ) as! CategoryCollectionViewCell
            
            cell.titleLabel.text = categories[indexPath.item]
            
            let isSelected = categories[indexPath.item] == selectedCategory
            cell.styleCell(isSelected: isSelected)
            
            return cell
        }
        
        // MARK: - Watch Cell (UPDATED)
        else {
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "WatchCell",
                for: indexPath
            ) as! WatchCollectionViewCell
            
            let watch = filteredWatches[indexPath.item]
            
            cell.watchImageView.image = UIImage(systemName: watch.image)
            cell.watchImageView.contentMode = .scaleAspectFit
            cell.watchImageView.tintColor = .black
            
            cell.nameLabel.text = watch.name
            cell.priceLabel.text = watch.price
            
            return cell
        }
    }
    
}
// MARK: - Selection
extension HomeViewController {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        // ✅ CATEGORY SELECTION
        if collectionView == categoryCollectionView {

            selectedCategory = categories[indexPath.item]

            // optional: clear search when category changes
            searchBar.text = ""

            filterData(searchText: "")

            categoryCollectionView.reloadData()
            watchCollectionView.reloadData()
        }

        // ✅ WATCH SELECTION (SAVE TO CORE DATA)
        else if collectionView == watchCollectionView {

            let watch = filteredWatches[indexPath.item]

                selectedWatch = CoreDataManager.shared.saveWatch(watch: watch)

                performSegue(withIdentifier: "toProduct", sender: self)
        }
    }
}

// MARK: - Search
extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData(searchText: searchText)
    }
}

// MARK: - Filtering
extension HomeViewController {
    
    func filterData(searchText: String = "") {
        
        filteredWatches = watches.filter { watch in
            
            let matchesCategory = (selectedCategory == "All") || (watch.category == selectedCategory)
            
            let matchesSearch = searchText.isEmpty ||
                watch.name.lowercased().contains(searchText.lowercased())
            
            return matchesCategory && matchesSearch
        }
        
        watchCollectionView.reloadData()
    }
}

