//
//  main.swift
//  Day06
//
//  Created by Anna Kim on 2022/12/11.
//

import Foundation

// Closure <- 변수 함수
    // struct, extension, closure

// 1. Function
func sumFunction(num1: Int, num2: Int) -> Int{
    return num1 + num2
}

print(sumFunction(num1: 10, num2: 20))

// 2. Closure(func 아님, 변수임): 사용처: Alert, action sheet
    //타입 정의
var sumClosure: (Int, Int) -> Int = {
    (num1: Int, num2: Int) -> Int in
    return num1 + num2
}
print(sumClosure(10,20))
