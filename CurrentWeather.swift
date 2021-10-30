//
//  Currentweather.swift
//  hidekeyboard
//
//  Created by Apple on 23.12.2020.
//

import Foundation
struct CurrentWeather{
    let cityName: String
    let temperature: Double
    var temperatureString: String{
        return String(format: "%.0f", temperature)
       // return "\(temperature.rounded())"
    }
    let feelslikeTemperature: Double
    var feelslikeTemperatureString: String {
        return String(format: "%.0f", feelslikeTemperature)
       // return "\(feelslikeTemperature.rounded())"
        }
    
    let conditionCode: Int
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default: return "nosign"
        }
        
    }
    
    init?(currntWeatherData: CurrentWeatherData) {
        cityName = currntWeatherData.name
        temperature = currntWeatherData.main.temp
        feelslikeTemperature = currntWeatherData.main.feels_like
        conditionCode = currntWeatherData.weather.first!.id
    }
}
