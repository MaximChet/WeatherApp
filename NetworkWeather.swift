//
//  NetworkWeather.swift
//  hidekeyboard
//
//  Created by Apple on 22.12.2020.
//

import Foundation

struct NetworkWeatherManager {
    
    var onConplition: ((CurrentWeather) -> Void)?
    
    func currentWeather(forCity city: String) {
        
    
let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
guard let url = URL(string: urlString) else {return}

let session = URLSession(configuration: .default)

let task =  session.dataTask(with: url) { data, response, error in
   
    
    if let data = data {
       
        if let currentWeather  =   self.parseJSON(withDate: data) {
            self.onConplition?(currentWeather)
                                   }
       
    
                       }
       
       
             }
        task.resume()
    }
    
    
    func parseJSON(withDate data: Data) -> CurrentWeather?{
        let decoder = JSONDecoder()
       do {
   let currentWeatherData = try  decoder.decode(CurrentWeatherData.self, from: data)
        guard let currentWeather = CurrentWeather(currntWeatherData: currentWeatherData) else
        {
            return   nil
            }
          return   currentWeather
        
        
     print(currentWeatherData.main.feels_like) 
       } catch let error as NSError {
        print(error)//localizedDescription)  //нихуя не работает с локолайз дискрипшен
       }
        return nil
    }
      
}
