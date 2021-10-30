//
//  AlertController.swift
//  hidekeyboard
//
//  Created by Apple on 22.12.2020.
//

import UIKit

extension ViewController {
    
    func presentSearchAlertController(witchTitle title: String?, message: String?, style: UIAlertController.Style,complitionHandler: @escaping (String)->Void) {
        
        
        let alertcontroller = UIAlertController( title: title, message: message, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let searchbutton = UIAlertAction(title: "Search", style: .default, handler: nil)
        alertcontroller.addTextField { (textField) in
            textField.placeholder = "Город"
            
        }
            
        alertcontroller.addAction(cancelButton)
        alertcontroller.addAction(searchbutton)
       
        present(alertcontroller, animated: true, completion: nil)
    }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        /*let alertcontroller = UIAlertController( title: title, message: message, preferredStyle: style)
         alertcontroller.addTextField{ tf in
            let citties = ["San Francisco", "Moscow", "New York", "Stanmul", "Vienna" ]
            tf.placeholder = citties.randomElement()
            }
 
        
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textfield = alertcontroller.textFields?.first
            guard let cityName = textfield?.text else {return}
           
            if cityName != "" {
             self.networkWeather.currentWeather(forCity: cityName)
                let city = cityName.split(separator: " ").joined(separator: "%20")
                complitionHandler(cityName)
            }
    }
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alertcontroller.addAction(search)
        alertcontroller.addAction(cancel)
    present(alertcontroller,animated: true, completion: nil)
} */
        
        
        
        
}

