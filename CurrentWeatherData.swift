//
//  CurrentWeatherData.swift
//  hidekeyboard
//
//  Created by Apple on 23.12.2020.
//

import Foundation
struct CurrentWeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    
    // меняю снейк_кейс на кэмелКейс
     /* enum CodingCase: String,CodingKey{
       case temp
       case feelsLike = "feels_like"
    }*/
}

struct Weather: Decodable {
    let id: Int
}
