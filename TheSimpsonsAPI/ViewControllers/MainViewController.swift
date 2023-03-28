//
//  MainViewController.swift
//  TheSimpsonsAPI
//
//  Created by Игорь Солодянкин on 27.03.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet var photoImage: UIImageView! {
        didSet {
            photoImage.layer.cornerRadius = 15
        }
    }
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Private properties
    private var quotes: [Quotes] = []
    private let networkManger = NetworkManager.shared
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchData()
    }
    
    //MARK: - IBAction
    @IBAction func nextQuoteButton() {
        activityIndicator.startAnimating()
        fetchData()
    }
    
    // MARK: - Private functions
    private func fetchData() {
        networkManger.fetchData(for: Link.url.rawValue) { [weak self] result in
            switch result {
            case .success(let quotes):
                self?.quotes = quotes
                self?.configure()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchImage(for imageString: String) {
        networkManger.fetchImage(from: imageString) { [weak self] imageData in
            self?.photoImage.image = UIImage(data: imageData)
        }
    }
    
    private func configure() {
        quotes.forEach { quote in
            authorLabel.text = "(\(quote.character))"
            quoteLabel.text = "'\(quote.quote)'"
            fetchImage(for: quote.image)
            activityIndicator.stopAnimating()
        }
    }
}

