import UIKit

var greeting = "Hello, playground"

class MovieTheatre {
    let movie : String?
    var seatsAvailable = [1,2,3,4,5]
    
    init(movie : String) {
        self.movie = movie
    }
    
    func bookSeats(seats : [Int]) -> [Int] {
        var seatsWhichAreBooked : [Int] = []
        for s in seats {
            if seatsAvailable.contains(s) {
                seatsWhichAreBooked.append(s)
                seatsAvailable = seatsAvailable.filter { $0 != s }
            } else {
                print("\(s) " + " cannot be booked as it is not available")
            }
        }
        return seatsWhichAreBooked
    }
}

let q1 = DispatchQueue(label: "q1", qos: .utility, attributes: .concurrent)
let semaphore = DispatchSemaphore(value: 1)
let mt = MovieTheatre(movie: "BhaiJaan")

q1.async(flags: .barrier) {
//    semaphore.wait()
    print("for 1st person")
    print(mt.bookSeats(seats: [1,2,3]))
    print(mt.seatsAvailable)
//    semaphore.signal()
}

q1.async(flags: .barrier) {
//    semaphore.wait()
    print("for 2nd person")
    print(mt.bookSeats(seats: [2,3]))
    print(mt.seatsAvailable)
//    semaphore.signal()
}

q1.async(flags: .barrier) {
//    semaphore.wait()
    print("for 3rd person")
    print(mt.bookSeats(seats: [4,5]))
    print(mt.seatsAvailable)
//    semaphore.signal()
}
