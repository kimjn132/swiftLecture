//
//  main.swift
//  Day02
//
//  Created by Anna Kim on 2022/12/03.
//

import Foundation

//String , 사용자 입력 확인
    //데이터 넣어주기
let str = " 1234"    //string 적지 않아도 swift 가 알아서 유추

print("str has \(str.count) characters")    //문자열 개수 계산 123.456 >>7 글자, 스페이스도 1글자로 인식


if str.count == 0{
    
    print("Data가 없습니다.")
}else{
    //trimming..>>스페이스 없애주기 (ex, 로그인, 회원가입 시 유저 아이디에 꼭 사용)
    print("Data는 \(str)이고 \(str.trimmingCharacters(in: .whitespaces).count)개의 글자 입니다.")
}

// Any: 잘 사용하지 않음, any는 any끼리만, 정수, 실수, 문자열  다 들어감 any type!!
var someAny: Any = 100
someAny = 123.12
someAny = "ABCD"

//any는 안좋음 * dart언어는 any도 계산 다 된다.
someAny =  10
//print(someAny + 10) >> 계산이 안된다


// Tuple: 간단하게 쓸 수 있는 arraylist, function에 사용, 배열 여러 개 사용할 때
// Tuple 사용전
var dialCode = 82
var isoCode = "KR"
var name = "Korea"


// Tuple 사용후
var country = (82, "KR", "Korea")
print(country.0, country.1, country.2)
    //dictionary 방식
var country1 = (dialCode1: 82, country1: "KR", name1: "Korea")
print(country1.dialCode1)
print(country1.0)   //번호로 써도 상관없다.

// Type(Int, Double, String..) 별칭 >> Tuple사용할 때 많이 사용, 자바의 생성자와 비슷

typealias MyInt = Int

let age: MyInt = 20

typealias person = (name:String, height: Int, marriage: Bool)

var t1:person = ("유비", 180, true)
print(t1)
print(t1.name)

// Tuple을 사용하여 직사각형의 넓이와 둘레
typealias rectangle = (name: String, w: Int, h: Int, area: Int, border: Int)

var r1: rectangle = ("직사각형1", 5, 6, 0, 0)
var r2: rectangle = ("직사각형2", 15, 7, 0, 0)

r1.area = r1.w*r1.h
r1.border = (r1.h + r1.w) * 2
print(r1)


// 기본 연산자
// 할당 연산자: DB에서 불러올 때 쓸 수 있다.
let (x1, x2) = (1, "kim")
print(x1)

// 사칙 연산자
print(1 + 2)
print(3 - 2)
print(4 * 3)
print(10 / 3)   //정수만 보여줌

print(10 / 3.0)
print(Double(10) / 3)

print(9 % 4)    //나머지

//단항 음수 연산자
let one = 1
let minusOne = -one
let plusOne = -minusOne
print(one, minusOne, plusOne)


//비교 연산자
let contentHeight = 40
let hasHeader = true        //header가 있다.
let rowHeight: Int          //값을 안 줄 때는 데이터타입 정해야 한다.

if hasHeader{
    rowHeight = contentHeight + 50
}else{
    rowHeight = contentHeight + 20
}
print(rowHeight)

// 삼항 조건 연산자
let rowHeight1 = contentHeight + (hasHeader ? 50 : 20)
print(rowHeight1)


// Nil병합 연산자 (Null 병합 연산자)
let str1: String?   //?들어가면 nil사용가능 없으면 String은 nil사용 불가, !는 nil 데이터 없애줌
str1 = nil


let defaultColorName = "red"
var userDefinedColorName: String?   //nil 수용

userDefinedColorName = "yellow"

var colorNameToUse = userDefinedColorName ?? defaultColorName   //nill이면 default, nil아니면 userDefinedColorName

print(colorNameToUse)   //userDefinedColorName 변수 안정해 주면 "red", "yellow"로 정해주면 "yellow"

// 범위 연산자
print(1...10)

//... 세개
for i in 1...10{
    print(i)
}
//.. 두개
for i in 1..<10{
    print(i)
}
// ..<9 : 0부터 9까지 나옴

var sum: Int = 0

for i in 1...10{
    sum += i
}
print("1~10까지의 합계는 \(sum) 입니다.")

for i in 1...9{
    print("5 X \(i) = \(5*i)")
}

for i in 1..<10{
    print("5 X \(i) = \(5*i)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]

for i in names{
    print(i)
}

for i in 0..<names.count{
    print(names[i])
}

// 논리 연산자
let enteredDoorCode = true
let passedRetinaScan = false

//강한 제어
if enteredDoorCode && passedRetinaScan{
    print("Welcome!")
}else{
    print("Access Denied!")
}

//느슨한 제어
if enteredDoorCode || passedRetinaScan{
    print("Welcome!")
}else{
    print("Access Denied!")
}


// Optional
//!: 강제적으로 forced unwrapping시키는 것 , 그렇지 않으면 노말 unwrapping

// : Value가 있을수도 있고 없을 수도 있는 경우
// : nil값이 포함될 수도 있고 안될 수도 있다.

let constrantNum = 100
//let optionalNum = nil
// !, ? 둘은 차이가 없다.
var optionalNum: Int? = nil
let optionalNum1: Int! = nil

optionalNum = 100


//안 쓰는 게 좋다.
//print(optionalNum1 as Any)




    // Optional Unwrapping (normal)
    var myName: String? = "Apple"
    //ios 앱에서는 nil값이 오면 앱이 죽는다. swift에서만 실행 가능

    print(myName)

    //리프렛 방식(가드렛방식 ios)
    if let name: String = myName{
        //데이터 있을 때
        print(name)
    }else{
        //myname이 nil일 경우
        print("myName is nil")
    }

    // Forced Unwrapping
    print(myName)   //Optional("Apple")
    print(myName!)  //Apple
    print(myName!)  //nil값이면 에러 난다.
    
    //이렇게 체크해주면 forced도 사용해도 무난하다.
    if myName?.count == 0{
        
    }
    print(myName!)


