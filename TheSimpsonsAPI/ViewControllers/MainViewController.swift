//
//  MainViewController.swift
//  TheSimpsonsAPI
//
//  Created by Игорь Солодянкин on 27.03.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
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
    
    //MARK: - IBActions
    @IBAction func nextQuoteButton() {
        activityIndicator.startAnimating()
        fetchData()
    }
    
    // MARK: - Private functions
    private func fetchData() {
        
    }
}

