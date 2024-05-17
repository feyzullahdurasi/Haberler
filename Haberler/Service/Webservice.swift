//
//  Webservice.swift
//  Haberler
//
//  Created by Feyzullah Durası on 16.05.2024.
//

import Foundation

class Webservice {
    
    func haberleriIndir(url: URL, comletion: @escaping ([News]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                comletion(nil)
            } else if let data = data{
                
                let haberlerDizisi = try? JSONDecoder().decode([News].self, from: data)
                
                if let haberlerDizisi = haberlerDizisi {
                    comletion(haberlerDizisi)
                }
                
            }
            
        }.resume()
        
    }
    
}
