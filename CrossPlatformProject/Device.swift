//
//  Device.swift
//  CrossPlatformProject
//
//  Created by Gennaro Amura on 30/05/18.
//  Copyright © 2018 Gennaro Amura. All rights reserved.
//

import Foundation


struct Device: Codable {
    
    let name: String
    let id: String
//    let brand_id: String
    let fotolink: String
    let year: String
    let price: String
    let brand: String
    
    
    init(name: String, id: String, fotolink: String, year: String, price: String, brand: String) {
        self.name = name
        self.id = id
        self.fotolink = fotolink
        self.year = year
        self.price = price
        self.brand = brand
    }

}


func loadDevice()->[Device] {
    var devices : [Device] = []
    let jsonUrl = "https://www.gennaroamura.it/crossplatform/query/getDevice.php"
    
    guard let url = URL(string: jsonUrl) else { return devices }
    let request: URLRequest = URLRequest(url: url)
    let session = URLSession.shared
    
    let semaphore = DispatchSemaphore(value: 0)
    session.dataTask(with: request) { (data, response, err) in
        guard let data = data else { return }
        
        do {
            devices = try JSONDecoder().decode([Device].self, from: data)
        } catch let jsonErr {
            print("Error: ",jsonErr)
        }
        
        semaphore.signal()
    }.resume()
    
    semaphore.wait()
    return devices
}

