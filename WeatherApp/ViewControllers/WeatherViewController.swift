//
//  ViewController.swift
//  WeatherApp
//
//  Created by Александр Прайд on 25.08.2020.
//  Copyright © 2020 Alexander Pride. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UISearchResultsUpdating {

    
    let networkWeatherManager = NetworkWeatherManager()
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLIkeTemperatureLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        
        networkWeatherManager.fetchCurrentWeather(forCity: "Moscow")
        
        
    }
    
    fileprivate func setupNavigationBar() {
        self.navigationItem.title = "WEATHER"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.barStyle = .black
        searchController.searchBar.barTintColor = #colorLiteral(red: 0.1411764706, green: 0.1411764706, blue: 0.1411764706, alpha: 1)
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    // MARK: SearchREsultUpdating
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}



