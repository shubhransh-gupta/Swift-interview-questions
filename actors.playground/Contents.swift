import UIKit

var greeting = "Hello, playground"

//class Movie {
//    let movieName = "Bhai Jaan"
//    var availableSeats = ["A1", "A2", "B1", "B2"]
//    let barrierQ = DispatchQueue(label: "q1", attributes: .concurrent)
//    func getAvailableSeatAfterBookingASingleSeat(seat : String) -> String {
//        barrierQ.sync(flags: .barrier) { [unowned self] in
//            if availableSeats.contains(seat) {
//                availableSeats = availableSeats.filter({$0 != seat})
//                return seat
//            }
//            return "NA"
//        }
//    }
//
//    func getAvailableSeats() -> [String] {
//        barrierQ.sync(flags: .barrier) {
//            return availableSeats
//        }
//    }
//}
//
//let q1 = DispatchQueue(label: "q1", attributes: .concurrent)
//let movie = Movie()
//
//q1.async {
//    print(movie.getAvailableSeatAfterBookingASingleSeat(seat: "B1"))
//}
//q1.async {
//    print(movie.getAvailableSeats())
//}

actor Movie {
    let movieName = "Bhai Jaan"
    var availableSeats = ["A1", "A2", "B1", "B2"]
    
    func getAvailableSeatAfterBookingASingleSeat(seat : String) -> String {
//        barrierQ.sync(flags: .barrier) { [unowned self] in
        
            if availableSeats.contains(seat) {
                availableSeats = availableSeats.filter({$0 != seat})
                return seat
            }
            return "NA"
        
//        }
    }
    
    func getAvailableSeats() -> [String] {
//        barrierQ.sync(flags: .barrier) {
            return availableSeats
//        }
    }
}

let q1 = DispatchQueue(label: "q1", attributes: .concurrent)
let movie = Movie()

q1.async {
    Task.detached {
        print(await movie.getAvailableSeatAfterBookingASingleSeat(seat: "B1"))
    }
}
q1.async {
    Task.detached {
        print(await movie.getAvailableSeats())
    }
}
