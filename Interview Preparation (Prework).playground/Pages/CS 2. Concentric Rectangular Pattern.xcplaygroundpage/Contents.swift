//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/**
 input = 3
 
 3 3 3 3 3
 3 2 2 2 3
 3 2 1 2 3
 3 2 2 2 3
 3 3 3 3 3
 
 **/

func concentricRectangularPattern2(_ n: Int) -> [[Int]] {
    let size = 2 * n - 1
    var array = Array(repeating: Array(repeating: 1, count: size), count: size)
    for row in 0 ..< size / 2{
        for column in row..<size - row {
            array[row][column] = n - row
            array[column][row] = n - row
            array[size-1-row][column]=n-row
            array[column][size-1-row]=n-row
        }
    }
//    array.forEach { print($0) }
    return array
}
print(concentricRectangularPattern2(3))

func concentricRectangularPattern(_ n: Int) -> [[Int]] {
    let size = n * 2 - 1
    var result = [[Int]]()
    for row in 0..<size {
        var array = [Int]()
        for column in 0..<size {
            let number = max(abs(size/2-row),abs(size/2-column)) + 1
            array.append(number)
        }
        result.append(array)
    }
    return result
}
print(concentricRectangularPattern(3))
