//
//  main.swift
//  Day03
//
//  Created by Anna Kim on 2022/12/04.
//

import Foundation


/*
 Collection : 여러값들을 묶어서 하나의 변수로 사용
 1) Array: 순서가 있는 리스트 컬렉션
 2) Dictionary(java: Map) : key와 value의 한쌍으로 이루어진 컬렉션
 3) Set : 집합, 순서가 없고, data가 unique, 집합연산
 */


// Array (let으로 사용하면 변경 불가, var로 만들면 늘였다 줄였다 바꿀 수 있다.) <>:generic
// var intVariable: Array<Int> = Array<Int>()   //이렇게 사용 잘 안한다.
var intVariable: [Int] = []
intVariable.append(1)
intVariable.append(100)
intVariable.append(10)

print(intVariable)

//Data의 존재 유무
print(intVariable.contains(100))    //true
print(intVariable.contains(90))     //false


print(intVariable[0])   //1
print(intVariable[0...1])   //1,100
print(intVariable[0...1][1])   //100        //화면 페이지 나누기(화면에 몇개씩 보여줄거다. 정하기, 1화면에 10개 보여주기: 1...10 이렇게 범위지정)


intVariable.remove(at: 0)
intVariable.removeLast()    //맨 뒤에 것 지우기
print(intVariable)
//intvariable.removeAll  ==  intvariable[]
print(intVariable.count)    //1개

var doubleArray: [Double] = []
var stringArray: [String] = []

var intVariable2 = [1,2,3]  //[]에 이미 숫자로 넣었으므로 타입 따로 안써도 된다.

// 문자열 배열
var shoppingList: [String] = ["Eggs", "Milk"]

//method1 이렇게 많이 씀
for i in shoppingList{
    print(i)
}
//Eggs, Milk

//method2
for i in 0..<shoppingList.count{
    print(shoppingList[i])
}

if shoppingList.isEmpty{
    
}

//한개씩 추가
shoppingList.append("Four")

//한개 이상씩 추가 (+= 누적기호)
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
//["Eggs", "Milk", "Four", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"] 7


print(shoppingList, shoppingList.count)

//데이터 수정

shoppingList[0] = "Egg"

print(shoppingList, shoppingList.count)
//["Egg", "Milk", "Four", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"] 7

// 특정 위치 데이터를 변경 및 제거
shoppingList[4...6] = ["Banana", "Apple"]
print(shoppingList, shoppingList.count)

//["Egg", "Milk", "Four", "Baking Powder", "Banana", "Apple"] 6

// 배열의 삽입(앱에서는 이동)
shoppingList.insert("Mayple Syrup", at: 0)
print(shoppingList, shoppingList.count)
//["Mayple Syrup", "Egg", "Milk", "Four", "Baking Powder", "Banana", "Apple"] 7

// 배열의 값과 인덱스가 필요한 경우 (Tuple)
for (index, value) in shoppingList.enumerated(){
    print(index, value)
}
//0 Mayple Syrup
//1 Egg
//2 Milk
//3 Four
//4 Baking Powder
//5 Banana
//6 Apple

// 배열의 합계 구하기
// 배열의 최대값 구하기
    //max는 optional이므로 !로 풀어서 써야 한다.
print(intVariable2.max()!)  //[1,2,3]중 3
print(shoppingList.max()!)  // abcde...중 가장 나중에 문자로 시작되는 단어 Milk


//tuple은 데이터 수정 가능, list는 데이터 수정 불가

// Dictionary
// key : value

var scoreDictionary: [String:Int] = [:]
scoreDictionary["유비"] = 100
scoreDictionary["관우"] = 90
scoreDictionary["장비"] = 80

//순서는 랜덤으로 나온다. array가 순서대로 나옴
print(scoreDictionary)

print(scoreDictionary["장비"]!)

// Set
var oddDigits: Set = [1,3,5,7,9,9,9]
let evenDigits: Set = [0,2,4,6,8]
let singlePrimeNumber: Set = [2,3,5,7]

print(oddDigits.sorted())   //중복된 것은 하나로만 나옴, sorted는 순서대로 정렬

// 합집합
print(oddDigits.union(evenDigits).sorted())

// 교집합
print(oddDigits.intersection(evenDigits).sorted())

// 차집합
print(oddDigits.subtracting(singlePrimeNumber).sorted())



/*
 if
 */

// Switch
let personAge = 14

if personAge < 1{
    print("baby")
}else if personAge < 3{
    print("toddler")
}else if personAge < 5{
    print("preschooler")
}else if personAge < 13{
    print("gradeschooler")
}else if personAge < 18{
    print("teen")
}else{
    print("adult")
}


// break가 디폴트로 들어가 있어서 따로 안 적어도 된다.
switch personAge{
case 0..<1: print("baby")
case 1..<3: print("toddler")
case 3..<5: print("preschooler")
case 5..<13: print("gradeschooler")
case 13..<18: print("teen")
default: print("adult")
}

/*
  이름, 국어, 영어, 수학 변수를 만들고 총점, 평균, 등급을 계산하기
 */

let name = "유비"
let kor = 91
let eng = 97
let math = 95

var tot = 0
var avg: Double = 0

tot = kor + eng + math
avg = Double(tot) / 3

print("이름 :", name)
print("국어 :", kor)
print("영어 :", eng)
print("수학 :", math)
print("총점 :", tot)
print("평균 :", String(format: "%.2f", avg))

var grade: String

// if
if avg >= 90{
    grade = "수"
}else if avg >= 80{
    grade = "우"
}else if avg >= 70{
    grade = "미"
}else if avg >= 60{
    grade = "양"
}else{
    grade = "가"
}



switch avg{
case 91...100: grade = "수"
case 80..<90: grade = "우"
case 70..<80: grade = "미"
case 60..<70: grade = "양"
default: grade = "가"
}




//삼항연산자: 퍼포먼스가 제일 좋다., if, switch문 둘다 삼항연산자에서 파생되어 만들어짐
grade = avg >= 90 ? "수" :
                            avg >= 80 ? "우" :
                                                avg >= 70 ? "미" :
                                                                    avg >= 60 ? "양" : "가"


//반복문
var score = [90, 80, 70, 60, 0]
var level = ["수", "우", "미", "양", "가"]



//for문은 if와 다르게 계속 돌아가므로 break걸어줘야 한다.
for i in 0..<score.count{
    if avg >= Double(score[i]){
        grade = level[i]
        break
    }
}

print("점수 등급은 \(grade) 입니다.")


