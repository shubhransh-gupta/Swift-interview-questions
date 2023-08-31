//
//  ViewController.swift
//  Fooboo
//
//  Created by Shubhransh Gupta on 31/08/23.
//

import UIKit

struct ResponseDataClass : Codable {
    let foo : String?
}

class ViewController: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.callPostAPI(requestParam : ["1" : "2", "3" : "4"], OnSuccess: { res in
                if let res = res {
                    print(res.foo)
                }
            })
        }
        // Do any additional setup after loading the view.
    }


    func callAPIThroughClosures(OnSuccess: @escaping (ResponseDataClass?) -> (), OnError: @escaping (String?) -> ()) {
        guard let url = URL(string: "https://api.jsonserve.com/h89D3-") else {
            OnError("URL is Wrong")
            return  // Return early when URL is wrong
        }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                OnError(error.localizedDescription)
                return  // Return if there's an error
            }
            
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(ResponseDataClass.self, from: data)
                    OnSuccess(response)
                } catch {
                    OnError(error.localizedDescription)
                }
            }
        }.resume()
    }



}

extension ViewController {
    
    func callPostAPI(requestParam : [String : String], OnSuccess : @escaping(ResponseDataClass?) -> ()) {
        guard let url = URL(string: "https://api.jsonserve.com/h89D3-") else {
            print("URL doesnt exist")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        guard let requestBody = try? JSONSerialization.data(withJSONObject: requestParam, options: []) else {
            print("request doesnt exist")
            return
        }
        request.httpBody = requestBody
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let response = try? JSONDecoder().decode(ResponseDataClass.self, from: data)
                    OnSuccess(response)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}

