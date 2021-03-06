//
//  NetworkService.swift
//  GBShop
//
//  Created by Григорий Виняр on 26/06/2022.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func logIn(urlString: String, name: String, password: String, result: @escaping (Bool) -> Void)
    func fetchData<T: Decodable>(urlString: String, queryItems: [URLQueryItem], completion: @escaping (T) -> Void)
}

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

class NetworkService: NetworkServiceProtocol {
    
    func logIn(urlString: String, name: String, password: String, result: @escaping (Bool) -> Void) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: urlString) else { return }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [
            URLQueryItem(name: "userName", value: name),
            URLQueryItem(name: "password", value: password)
        ]
        
        guard let urlFromComponents = urlComponents?.url else { return }
        var request = URLRequest(url: urlFromComponents)
        
        request.httpMethod = "POST"
        
        session.dataTask(with: request) { data, response, error in
            guard data != nil, error == nil else {
                result(false)
                return
            }
            result(true)
        }.resume()
        
    }
    
    func fetchData<T: Decodable>(urlString: String, queryItems: [URLQueryItem], completion: @escaping (T) -> Void) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        guard let url = URL(string: urlString) else { return }
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }
        urlComponents.queryItems = queryItems
        
        guard let finishUrl = urlComponents.url else { return }
        
        session.dataTask(with: finishUrl) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(object)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
}
