import UIKit
import PlaygroundSupport
import Combine

PlaygroundPage.current.needsIndefiniteExecution = true


//Normal API called
if let url = URL(string: "https://api.myjson.com/bins/yfua8") {
    URLSession.shared.dataTask(with: url) { data, res, err in
        if let data = data {
            if let json = String(data: data, encoding: .utf8) {
                print(json)
            }
        }
        if let err = err {
            print(err as? NSError)
        }

    }.resume()
}

struct ResponseDataClass : Codable {
    let foo : String?
}
//API call using codable protocol
func callAPI() {
    guard let url = URL(string: "https://api.jsonserve.com/h89D3-") else {
        print("url is wrong")
        return
    }
    let session = URLSession.shared
    session.dataTask(with: url) { data, res, err in
        if let err = err {
            print(err)
        }

        if let data = data {
            do {
                let serialiseData = try JSONDecoder().decode(ResponseDataClass.self, from: data)
                print(serialiseData.foo ?? "error1")
            } catch {
                print("error")
            }
        }
    }.resume()
}

callAPI()


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




let publisher = [1, 2, 3, 4, 5].publisher

let subscription = publisher
    .map { $0 * 2 }
    .filter { $0 % 3 == 0 }
    .sink { value in
        print(value) // Output: 6, 12
    }


//protocol CommunicationDelegate : AnyObject {
//    func toReceiveData(data : Any)
//}
//
//class Sender {
//    var name : String?
//    weak var del : CommunicationDelegate?
//    init(_ name : String) {
//        self.name = name
//    }
//
//    func passData(data : Any) {
//        del?.toReceiveData(data: data)
//    }
//}
//
//class Receiver : CommunicationDelegate {
//    func toReceiveData(data: Any) {
//        print("\(data)")
//    }
//}
//
//let sender = Sender("Hello I am sender")
//let receiver = Receiver()
//sender.del = receiver
//
//sender.passData(data: "Hey Receiver")
//sender.passData(data: "How are you?")

//func printx(_ a : Int) {
//    for i in 1...20*a {
//        print("\(a)" + " - \(i)")
//    }
//}

//func perform() {
//    let q1 = DispatchQueue(label: "q1", attributes: .concurrent)
//    let q2 = DispatchQueue(label: "q2")
//    let q3 = DispatchQueue(label: "q3")
//
//    q3.async {
//        printx(1)
//        q2.sync {
//            printx(2)
//            q3.async {
//                printx(6)
//            }
//        }
//        q3.async {
//            printx(3)
//        }
//        q2.sync {
//            printx(4)
//        }
//        q3.async {
//            printx(5)
//        }
//    }
//}
//perform()
