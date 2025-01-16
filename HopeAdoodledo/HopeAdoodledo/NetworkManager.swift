//
//  NetworkManager.swift
//  HopeAdoodledo
//
//  Created by Shubhransh Gupta on 15/01/25.
//

import UIKit

protocol NetworkDataProviderDelegate: AnyObject {
    func fetchUser(param: String, completion: @escaping (Result<User, Error>) -> Void)
    func fetchDriver(param: String, completion: @escaping (Result<Driver, Error>) -> Void)
}

final class NetworkManager {
    private init() { }
    
    static let shared = NetworkManager()
    
    static let baseUrl = "https://jsonplaceholder.typicode.com/todos/"
    
    static let dataSession = URLSession.shared
    
    func fetchData<T: Decodable>(param: String, completion: @escaping (Result<T, Error>) -> Void) {
        let urlString = NetworkManager.baseUrl + param
        let url = URLRequest(url: URL(string: urlString)!)
        
        NetworkManager.dataSession.dataTask(with: url) { data, _, err in
            if let err = err { completion(.failure(err)) }
            guard let data else {
                completion(.failure(NSError(domain: "Not Parsed", code: 101, userInfo: nil)))
                return
            }
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            } catch let error {
                completion(.failure(NSError(domain: "Not Parsed", code: 101, userInfo: nil)))
            }
        }
        .resume()
    }
    
}

extension NetworkManager: NetworkDataProviderDelegate {
    func fetchUser(param: String, completion: @escaping (Result<User, any Error>) -> Void) {
        NetworkManager.shared.fetchData(param: param, completion: { (response: Result<User, Error>) in
            switch response {
            case .success(let data):
                if let data = data as? User {
                    print(data)
                    completion(.success(data))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func fetchDriver(param: String, completion: @escaping (Result<Driver, any Error>) -> Void) {
        NetworkManager.shared.fetchData(param: param, completion: { (response: Result<Driver, Error>) in
            switch response {
            case .success(let data):
                if let data = data as? Driver {
                    print(data)
                    completion(.success(data))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
        
    }
    
    
}
