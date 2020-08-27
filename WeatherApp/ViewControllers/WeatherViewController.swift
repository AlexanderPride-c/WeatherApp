//
//  ViewController.swift
//  WeatherApp
//
//  Created by Александр Прайд on 25.08.2020.
//  Copyright © 2020 Alexander Pride. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UISearchResultsUpdating {

    var timer = Timer()
    
    var networkWeatherManager = NetworkWeatherManager()
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLIkeTemperatureLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        
        self.networkWeatherManager.delegate = self
        self.networkWeatherManager.fetchCurrentWeather(forCity: "Moscow")
        
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
    
    // MARK: SearchResultUpdating
    func updateSearchResults(for searchController: UISearchController) {
        let city = searchController.searchBar.text!
        
        timer.invalidate()
        
        if city != "" {
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (timer) in
                self.networkWeatherManager.fetchCurrentWeather(forCity: city)
            })
        }
    }
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLIkeTemperatureLabel.text = weather.feelsLikeTemperature
            self.descriptionLabel.text = weather.descriptionWeather
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
}

extension WeatherViewController: NetworkWeatherManagerDelegate {
    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather) {
        self.updateInterfaceWith(weather: currentWeather)
    }
}



