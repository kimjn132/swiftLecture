//
//  main.swift
//  Day04
//
//  Created by Anna Kim on 2022/12/09.
//

import Foundation

//반복문

    //Array
let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names{
    print("Hello \(name)~~")
}

//빅데이터에서는 못씀..Dictionary, widget, map  //순서대로 가져옴 X
let numberOfLegs = ["spider":8, "ant":6, "cat":4]

for (animalName, legCount) in numberOfLegs{
    print("\(animalName)'s have \(legCount) legs.")
}

//반복문을 통한 범위 연산자 처리
let seq1 = 1...5
for index in seq1{
    print("\(index) times 5 is \(index*5)")
}

//reversed
let seq2 = (1...5).reversed()
for index in seq2{
    print("\(index) times 5 is \(index*5)")
}

// 증가치 간격 조정
let minutes = 60
let minuteInterval = 5

//to ~까지(55까지만 나옴)
for tickMark in stride(from: 0, to: minutes, by: minuteInterval){
    print(tickMark)
}

//through ~통과(60까지 다나옴)
for tickMark in stride(from: 0, through: minutes, by: minuteInterval){
    print(tickMark)
}

//--------
// Function(java:method)

// 매개변수가 있는 함수
func integerSum(num1: Int, num2: Int) -> Int{
    return num1 + num2
}

print(integerSum(num1: 5, num2: 8))

func integerSum2(num1: Int, num2: Int) -> Void{   //void 안 써도 됨
    print(num1 + num2)
}

integerSum2(num1: 10, num2: 12)

func integerSum3(_ num1: Int, _ num2: Int) -> Int{
    return num1 + num2
}

print(integerSum3(20, 30))

func integerSum4(숫자1 num1: Int, 숫자2 num2: Int) -> String{
    return "\(num1) + \(num2) = \(num1 + num2)"
}

print(integerSum4(숫자1: 50, 숫자2: 30))

// 매개변수 기본값
func greeting(friend: String, me: String = "조조"){
    print("Hello \(friend)! I'm \(me).")
}

greeting(friend: "동탁")
greeting(friend: "유비", me: "관우")  //ctrl+space 로 추가사항 확인 가능


// Overloading -함수의 이름은 중복되도 매개변수의 개수로 구분하여 사용가능 (overriding: 상속, 부모에게 상속)
// 도형의 면적과 둘레를 구하는 함수(원, 직사각형, 직각삼각형)

func shape(_ r: Double){
    let pi = 3.1415
    let area = r * r * pi
    let border = 2 * pi * r
    print("원 : \(area), \(border)")
}

func shape(_ w: Int, _ h: Int){
    let area = w * h
    let border = (w+h) * 2
    print("직사각형 : \(area), \(border)")
}

func shape(_ w: Int, _ h: Int, _ l: Int){
    let area = w*h/2
    let border = (w+h+l)
    print("직각삼각형 : \(area), \(border)")
}

shape(5)
shape(5, 6)
shape(5, 6, 7)

// 상태변수: 화면의 상태(예 - 현재 화면에 보이는 그림은 큰 그림 / 작은 그림 미리 저장해놓고 사용한다.)
