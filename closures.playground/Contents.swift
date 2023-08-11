import Foundation

var hello = {
    "Hey this is shubhransh"
}()
let a = "Ram"
hello = a

print(hello)

func doArithmetic(isMultiply : Bool) -> (Double, Double) -> Double {
    func multiply(n1: Double, n2: Double) -> Double {
        return n1*n2
    }

    func add(n1: Double, n2: Double) -> Double {
        return n1+n2
    }

    return isMultiply ? multiply : add
}

let ab = doArithmetic(isMultiply: true)
let bb = doArithmetic(isMultiply: false)

print(ab(2,3))

print(bb(2,3))



var i = 0
var closureArray = [()->()]()
for _ in 1..<6 {
closureArray.append {
print(i)
}
i += 1
}
closureArray[0]()
closureArray[1]()
closureArray[2]()
closureArray[3]()
closureArray[4]()

var closureArray2 = [()->()]()
var j = 0
for _ in 1..<6 {
closureArray2.append { [j] in
print(j)
}
j += 1
}
// here i will be 5
closureArray2[0]() // prints 0
closureArray2[1]() // prints 1
closureArray2[2]() // prints 2
closureArray2[3]() // prints 3
closureArray2[4]() // prints 4

var myName = "prasanna"
let hello2 = {
    print(myName)
}
print(hello2())
myName = "shubransh";

print(hello2())
