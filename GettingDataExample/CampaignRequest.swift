//
//  CampaignRequest.swift
//  GettingDataExample
//
//  Created by Mücahit Eren Özkur on 6.03.2022.
//

import Foundation
import UIKit

enum CampaignError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct CampaignRequest {
    let resourceURL: URL
    
    init() {
        let resourceString = "http://www.bucayapimarket.com/json.php"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError("Error")
        }
        self.resourceURL = resourceURL
    }
    
    func getCampaign(completion: @escaping(Result<[Campaign], CampaignError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, response, error in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let campaigns = try decoder.decode([Campaign].self, from: jsonData)
                completion(.success(campaigns))
            } catch  {
                completion(.failure(.canNotProcessData))
            }
        }
        
        dataTask.resume()
    }
}
