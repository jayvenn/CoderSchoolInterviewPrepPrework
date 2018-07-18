//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

extension Array {
    func decompose() -> (Iterator.Element, [Iterator.Element])? {
        guard let x = first else { return nil }
        return (x, Array(self[1..<count]))
    }
}

func between<T>(_ x: T, _ ys: [T]) -> [[T]] {
    guard let (head, tail) = ys.decompose() else { return [[x]] }
    return [[x] + ys] + between(x, tail).map { [head] + $0 }
}

func permutations<T>(_ array: [T]) -> [[T]] {
    guard let (head, tail) = array.decompose() else { return [[]] }
    return permutations(tail).flatMap { between(head, $0) }
}

let permutations = permutations([1, 2, 3])
print(permutations)
