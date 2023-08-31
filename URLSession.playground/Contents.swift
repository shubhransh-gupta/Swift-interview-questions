import UIKit
import PlaygroundSupport
 
PlaygroundPage.current.needsIndefiniteExecution = true


//Normal API called
//if let url = URL(string: "https://api.myjson.com/bins/yfua8") {
//    URLSession.shared.dataTask(with: url) { data, res, err in
//        if let data = data {
//            if let json = String(data: data, encoding: .utf8) {
//                print(json)
//            }
//        }
//        if let err = err {
//            print(err as? NSError)
//        }
//
//    }.resume()
//}

struct ResponseDataClass : Codable {
    let foo : String?
}
////API call using codable protocol
//func callAPI() {
//    guard let url = URL(string: "https://api.jsonserve.com/h89D3-") else {
//        print("url is wrong")
//        return
//    }
//    let session = URLSession.shared
//    session.dataTask(with: url) { data, res, err in
//        if let err = err {
//            print(err)
//        }
//
//        if let data = data {
//            do {
//                let serialiseData = try JSONDecoder().decode(ResponseDataClass.self, from: data)
//                print(serialiseData.foo ?? "error1")
//            } catch {
//                print("error")
//            }
//        }
//    }.resume()
//}
//
//callAPI()


func callAPIThroughClosures(OnSuccess : @escaping(ResponseDataClass?) -> (), OnError : @escaping(String?) -> ()) {
    guard let url = URL(string: "https://api.jsonserve.com/h89D3-") else {
        OnError("URL is Wrong")
    }
    
    let session = URLSession.shared
    
    session.dataTask(with: url) { data, res, err in
        if let err = err {
            OnError(err.localizedDescription)
        }
        if let data = data {
            do {
                let response = try JSONDecoder().decode(ResponseDataClass.self, from: data)
                OnSuccess(response)
            } catch let errpr as? NSError {
                OnError(errpr)
            }
        }
    }.resume()
}
DispatchQueue.main.async {
    callAPIThroughClosures(OnSuccess: { res in
        if let res = res {
            print(res.foo)
        }
    }) { err in
        print(err)
    }
}

