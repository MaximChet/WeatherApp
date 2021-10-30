//


import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var weatherIconImageView: UIImageView!
   
    @IBOutlet weak var cityLabel: UILabel!
        
    @IBOutlet weak var temperaturelabel: UILabel!
    
    @IBOutlet weak var feelsLikeTemperature: UILabel!
    
   var networkWeather = NetworkWeatherManager()
    
    
 
    @IBAction func alert(_ sender: UIButton) {
     //   self?.updateInterface(weather: CurrentWeather)
        
        let alertcontroller = UIAlertController( title: title, message: "Enter the city", preferredStyle: .alert)
      
        let search = UIAlertAction(title: "Search", style: .default) { (action) in
            let textFieldCity = alertcontroller.textFields?.first
           // print(textFieldCity?.text)
            guard let city = textFieldCity?.text else {return}
            if city != "" {
                //print("search info for \(city)")
                self.networkWeather.currentWeather(forCity: city)
                print(city)
            }
        }
        
        alertcontroller.addTextField { (textField) in
            textField.placeholder = "Moscow, Ufa, Minsk"
        }
        
 
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
      //  alertcontroller.addAction(search)
        alertcontroller.addAction(search)
        alertcontroller.addAction(cancel)
        present(alertcontroller, animated: true, completion: nil)
    }
    
        
    
    override func viewDidLoad() {
    super.viewDidLoad()
   // networkWeather.onConplition = {CurrentWeather in
        networkWeather.onConplition = { CurrentWeather in
          //  guard let self = self else {return}
            self.updateInterface(weather: CurrentWeather) // либо другая карент везер,бля
            print(CurrentWeather.cityName)
        }
        networkWeather.currentWeather(forCity: "London")
        
        }
   func updateInterface(weather: CurrentWeather) {
    DispatchQueue.main.async {
        self.cityLabel.text = weather.cityName
        self.temperaturelabel.text = " " + weather.temperatureString + " ℃"
        self.feelsLikeTemperature.text = "     Feels like: " + weather.feelslikeTemperatureString + " ℃"
        self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
           }
        
      }

}


