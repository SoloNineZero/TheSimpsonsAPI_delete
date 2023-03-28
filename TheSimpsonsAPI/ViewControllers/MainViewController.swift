//
//  MainViewController.swift
//  TheSimpsonsAPI
//
//  Created by Игорь Солодянкин on 27.03.2023.
//

import UIKit
import Alamofire

final class MainViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var photoImage: UIImageView!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var characterLabel: UILabel!
    
    
    // MARK: - Private properties
    private var quotes: [Quotes] = []
    private let networkManger = NetworkManager.shared
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchQuote()
        
        title = "The Simpsons quote"
    }
    
    //MARK: - IBActions
    @IBAction func nextQuoteButton() {
        activityIndicator.startAnimating()
        fetchQuote()
    }
    
    // MARK: - Private functions
    private func fetchQuote() {
        networkManger.fetchQuote(from: "\(Link.apiSimpsonsUrl.url)") { [weak self] result in
            switch result {
            case .success(let quotes):
                self?.quotes = quotes
                self?.configure()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func configure() {
        quotes.forEach { quote in
            quoteLabel.text = "'\(quote.quote)'"
            characterLabel.text = "(\(quote.character))"
            networkManger.fetchImage(from: quote.image) { [weak self] result in
                switch result {
                case .success(let imageData):
                    self?.photoImage.image = UIImage(data: imageData)
                case .failure(let error):
                    print(error)
                }
            }
            activityIndicator.stopAnimating()
        }
    }
}

