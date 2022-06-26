//
//  NetworkService.swift
//  GBShop
//
//  Created by Григорий Виняр on 26/06/2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(urlString: String, completion: @escaping (T) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func fetchData<T: Decodable>(urlString: String, completion: @escaping (T) -> Void) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: urlString) else { return }
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(object)
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
}
