//
//  CurrentWeatherData.swift
//  WeatherApp
//
//  Created by Александр Прайд on 26.08.2020.
//  Copyright © 2020 Alexander Pride. All rights reserved.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}

struct Weather: Codable {
    let id: Int
    let description: String
}
