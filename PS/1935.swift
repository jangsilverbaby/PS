//
//  main.swift
//  PS
//
//  Created by eunae on 2022/06/12.
//

import Foundation

let N = Int(readLine()!)!
let formula = readLine()!.map{ String($0) }
var array: [Int] = []
for _ in 1...N {
    let e = Int(readLine()!)!
    array.append(e)
}
var stack = [Double]()


for f in formula {
    let ascii = Int(UnicodeScalar(f)!.value)
    if ascii < 65 {
        let result: Double
        switch f {
        case "+":
            let a = stack.removeLast()
            let b = stack.removeLast()
            result = b + a
        case "-":
            let a = stack.removeLast()
            let b = stack.removeLast()
            result = b - a
        case "*":
            let a = stack.removeLast()
            let b = stack.removeLast()
            result = b * a
        default:
            let a = stack.removeLast()
            let b = stack.removeLast()
            result = b / a
        }
        stack.append(result)
    } else {
        stack.append(Double(array[ascii - 65]))
    }
}

print(String(format: "%.2f",stack[0]))
