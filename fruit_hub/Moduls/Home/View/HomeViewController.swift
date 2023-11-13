//
//  HomeViewController.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import UIKit

class HomeViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var categotyCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    // MARK: - Variables
    var didSendEventClosure: ((HomeViewController.Event) -> Void)?
    var viewModel: HomeViewModelProtocol?
    var categorySelected: CategoryModel?
    var products: [ProductModel] = []
    
    init(viewModel: HomeViewModelProtocol?) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("HomeViewController deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupCollectionView()
    }
    
    private func setupUI() {
        let welcomeText = "Hello \(Session.shared.name ?? ""), What fruit salad combo do you want today?"
        welcomeLabel.text = welcomeText
        
        mockCategory.forEach { category in
            if category.isSelected {
                categorySelected = category
            }
        }
        
        setupProductData()
    }
    
    private func setupProductData() {
        mockProduct.forEach { product in
            if product.categoryId == categorySelected?.id {
                products.append(product)
            }
        }
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        productCollectionView.dataSource = self
        categotyCollectionView.dataSource = self
        categotyCollectionView.delegate = self
        collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        productCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        categotyCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }

}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return mockProductRecommended.count
        } else if collectionView == self.categotyCollectionView {
            return mockCategory.count
        } else if collectionView == self.productCollectionView {
            return products.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
            let data = mockProductRecommended[indexPath.row]
            cell.setupUI(product: data)
            return cell
        } else if collectionView == self.categotyCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            var data = mockCategory[indexPath.row]
            cell.categorySelected = self.categorySelected
            cell.setupUI(data: data)
            return cell
        } else if collectionView == self.productCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
            let data = products[indexPath.row]
            cell.setupUI(product: data)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.categorySelected = mockCategory[indexPath.row]
        self.products = []
        setupProductData()
        productCollectionView.reloadData()
        categotyCollectionView.reloadData()
    }
}

extension HomeViewController {
    enum Event {
        case finish
    }
}
