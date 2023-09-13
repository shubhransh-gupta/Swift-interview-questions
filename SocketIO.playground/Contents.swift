import UIKit

// Create a socket object
let socket = Socket()

// Set the host and port
let host = "localhost"
let port = 8080

// Connect to the server
do {
    try socket.connect(to: host, port: port)
    print("Connected to \(host) on port \(port)")
} catch let error {
    print("Error connecting to server: \(error.localizedDescription)")
}

// Send data to the server
let message = "Hello, server!"
let data = message.data(using: .utf8)!
socket.write(data: data)

// Receive data from the server
let bufferSize = 1024
var receivedData = Data()
var bytesRead = 0

repeat {
    var buffer = **UInt8** (*<repeating: 0, count: bufferSize>*)
    bytesRead = socket.read(into: &buffer, maxLength: bufferSize)
    receivedData.append(buffer, count: bytesRead)
} while bytesRead > 0

if let receivedMessage = String(data: receivedData, encoding: .utf8) {
    print("Received message from server: \(receivedMessage)")
}

// Close the socket connection
socket.close()
