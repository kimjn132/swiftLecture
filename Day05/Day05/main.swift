//
//  main.swift
//  Day05
//
//  Created by Anna Kim on 2022/12/10.
//

import Foundation


// 구조체(struct)와 클래스(class)
// 클래스 상속 가능(메모리 비중 크다), 구조체는 상속 불가

struct Sample{
    // Property
    var sampleProperty: Int = 10
    let fixedSampleProperty: Int = 10
    static var typeProperty: Int = 1000
    
    // Contructor
    
    // Function
    func instanceMethod(){
        print("instance method")
    }
    
    static func typeMethod(){
        print("type method")
    }
    
    
}

// 구조체 사용
// (생성자)인스턴스이름: 구조체타입 = 구조체이름
var sample: Sample = Sample()
// swift는 타입 유추 가능
var sample1 = Sample()
//sample != sample1

print(sample.sampleProperty)    //10
sample.sampleProperty = 20
print(sample.sampleProperty)    //20

print(sample1.sampleProperty)   //10

print(Sample.typeProperty)  //static은 생성자 없이 사용 가능


//3번 문제 interval 한 개로: 1번 사진은 똑같이, 2번 사진은 if interval % 3 == 0{} 이렇게 사용하면 됨..


// Extension-기능확장
// : struct, class 타입에 새로운 기능을 추가할 수 있는 기능(그래서 상속의 의미가 없다.)

extension Int{
    //method
    var isEven: Bool{
        return self % 2 == 0
    }
    var isOdd: Bool{
        return self % 2 == 1
    }
}

print(1.isEven)
print(1.isOdd)

var number = 3
print(number.isEven)
print(number.isOdd)
//Delegate(내가 주는 것만 사용해라)
//keyboard에 return 키 누르면 입력값이 나오는 기능


