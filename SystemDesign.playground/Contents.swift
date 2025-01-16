import UIKit

struct User {
    let name: String?
    let email: String?
    let mobileNo: String?
    let id = UUID()
    let location = Array<String>(repeating: "560076", count: 2)
}

struct Driver {
    let name: String?
    let email: String?
    let mobileNo: String?
    let vehicleNo: String?
    let id = UUID()
    let location = Array<String>(repeating: "560076", count: 2)
}

/*
 NetworkManager --> API calls
 DiskManager -> storing and retrieving data on device
 MVVVM :
 
 Views : -> TVC
 VC -> TableViewController
 VM -> VM dependent on Networkmanager & DiskManager
 
