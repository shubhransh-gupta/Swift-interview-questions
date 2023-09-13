import UIKit

//import Combine
//
//enum NetworkError: Error {
//    case invalidURL
//    case requestFailed
//}

//func fetchExampleData() -> AnyPublisher<String, NetworkError> {
//    return URLSession.shared.dataTaskPublisher(for: URL(string: "https://example.com")!)
//        .map(\.data)
//        .decode(type: String.self, decoder: JSONDecoder())
//        .mapError { error in
//            if let urlError = error as? URLError {
//                return NetworkError.invalidURL
//            }
//            return NetworkError.requestFailed
//        }
//        .eraseToAnyPublisher()
//}

//let cancellable = fetchExampleData()
//    .sink(
//        receiveCompletion: { completion in
//            switch completion {
//            case .finished:
//                print("Request completed successfully.")
//            case .failure(let error):
//                print("Request failed with error: \(error)")
//            }
//        },
//        receiveValue: { data in
//            print("Received data: \(data)")
//        }
//    )

//func fetchData() -> AnyPublisher<String, NetworkError> {
//    return URLSession.shared.dataTaskPublisher(for: URL(string: "https://google.com")!)
//        .map(\.data)
//        .decode(type: String.self, decoder: JSONDecoder())
//        .mapError{ error in
//            if let urlError = error as? URLError {
//                return NetworkError.invalidURL
//            }
//            return NetworkError.requestFailed
//        }
//        .eraseToAnyPublisher()
//}
//
//let can = fetchData()
//    .sink(
//        receiveCompletion : { com in
//            switch com {
//            case .finished:
//                print("Request completed successfully.")
//            case .failure(let error):
//                print("Request failed with error: \(error)")
//            }
//
//        },
//        receiveValue : { data in
//            print("success")
//        }
//          )
func printx(_ a : Int) {
    for i in 1...20*a {
        print("\(a)" + " - \(i)")
    }
}

func perform() {
    let q1 = DispatchQueue(label: "q1", attributes: .concurrent)
    let q2 = DispatchQueue(label: "q2")
    let q3 = DispatchQueue(label: "q3")
    
    q1.async {
        printx(1)
        q1.async {
            printx(2)
            q3.async {
                printx(6)
            }
        }
        q3.sync {
            printx(3)
        }
        q3.sync {
            printx(4)
        }
        q3.async {
            printx(5)
        }
        q1.async {
            printx(7)
            q3.async {
                printx(8)
            }
        }
    }
}
perform()
