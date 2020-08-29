//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Александр Прайд on 26.08.2020.
//  Copyright © 2020 Alexander Pride. All rights reserved.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0f", temperature)
        
    }
    
    let feelsLike: Double
    var feelsLikeTemperature: String {
        return String(format: "%.0f", feelsLike)
    }
    
    let coditionCode: Int
    var systemIconNameString: String {
        switch coditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "snow"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min"
        case 801...804: return "cloud.fill"
        default: return "paperplane.fill"
        }
    }
    
    let descriptionWeather: String
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLike = currentWeatherData.main.feelsLike
        coditionCode = currentWeatherData.weather.first!.id
        descriptionWeather = currentWeatherData.weather.first!.description
        
        return
    }
}


