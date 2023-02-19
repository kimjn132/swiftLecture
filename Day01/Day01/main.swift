//
//  main.swift
//  Day01
//
//  Created by Anna Kim on 2022/12/02.
//

import Foundation


/*
 상수(자바는 final) : let (한번 들어가면 다시 못 바꾼다.)
 변수 : var_name :
 
 ~상수 선언 방법
 let <variable_name> : <type> = <value>
 
 ~변수 선언 방법
 var <variable_name> : <type> = <value>
 
 */

//상수 (트론 방법-숫자를 넣어주면 알아서 int 선언해줌)
let intLetNum1: Int = 200
let intLetNum2 = 100


var intVarNum1: Int = 200
var intVarNum2 = 100
//let, var 나누는 이유는 메모리 크기때문이다(퍼포먼스때문) var 메모리가 크다
//intLetNum1 = 2000

intVarNum1 = 1000


var nickName: String = "유비" //여러 문자열
var nickName2: Character = "😀" //''안쓴다. 알파벳 하나, 이모지 하나>그림 아님(글자임)

var doubleNum1: Double = 3.14
var floatNum1: Float = 3.14

var aNum=9, bNum=10 //권장하지 않음
var doubleNum2 = 3.14
//타입 물어보기
print(type(of: doubleNum2))

var nickName3 = "A"
print(type(of: nickName3))

//HelloWorld

//String Interpolation(문자열 보간법) : /(변수이름)
let studentName = "홍길동"

print("Name :" + studentName)
print("Name :", studentName)
print("Name : \(studentName)")

let one = 1
let two = 2


//1 + 2 = 3
//print(one + "+" + two + "=" + (one+two))


print("\(one) + \(two) = \(one+two)")


let age: Int = 10
print("저는 \(age)살 입니다.")
print("저의 형은 \(age+4)살 입니다.")


var name1 = "유비"
var age1 = 34
var gender1 = "남자"


//회원의 이름은 유비이고 나이는 34살이며 성별은 남자 입니다.


print("회원의 이름은 \(name1)이고 나이는 \(age1)살이며 성별은 \(gender1)입니다.")


//------------
//기본 데이터 타입
var sameBool: Bool = true
var someInt: Int = -100
someInt = 100_000 //천단위 or 100__000
print(someInt)

//아래 둘 다 __사용 가능
var someFloat: Float = 3.14
var someDouble: Double = 3.14
var someString: String = "apple"
var someCharacter: Character = "A"

//숫자 변환
let doubleNum: Double = 4.9999
//실수를 정수로 변환
var castToInt: Int = Int(doubleNum)
//반올림
var roundToInt: Int = Int(doubleNum.rounded())  //반올림

print(doubleNum, castToInt, roundToInt) //4,9999  4  5

//여러 줄 \n이나 \t 안쓰고 쓸 수 있다.


someString = """
1234
    ABCD
        가나다라
"""


print(someString)   //그대로 나온다.


print("aa\tbb\ncc")
//\"~~\"는 ""를 보여주겠다는 의미
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"


print(wiseWords)

var name2: String
var size2: Int
var weight2: Double
var bag2: Bool
var color2: Character

name2 = "맥북프로"
size2 = 16
weight2 = 2.56
bag2 = false
color2 = "백"

print("\(name2)는 \(size2)인치이고 무게는 \(weight2)이고 컬러는 \(color2)색 입니다.")

let string1: String = "hello"
let string2: String = " there"
var welcome = string1 + string2
print(welcome)

var instruction = "look over"
instruction += string2  //look over there
print(instruction)



size2+=1

let mark: Character = "!"

//string으로 따로 변환 안해줘도 됨
welcome.append(mark)
print(welcome)

