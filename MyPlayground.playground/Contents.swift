import UIKit

var greeting = "Hello, playground"
greeting = "Hello, Swift"
let constStr = greeting
//constStr = "Hello, world"

// 数据类型
var nextYear: Int
var bodyTmp: Float
var hasPet: Bool

var arrayOfInts: Array<Int>
var arrayOfInts1: [Int] // 简洁声明

var dictionaryOfCapitalsByCountry: Dictionary<String, String>
var dictionaryOfCapitalsByCountry1: [String: String] // 简洁声明

var winningLotteryNumbers: Set<Int>

// 字面量与角标
let number = 41
let fmStation = 91.1

var countingUp = ["one", "two"]
let nameByParkingSpace = [13: "Alice", 27: "Bob"]

let secondElement = countingUp[1]

let emptyString = String()
let emptyString1 = ""
let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()

let defaultInt = Int()
let defaultBool = Bool()

let number2 = 42
let meaningOfLife = String(number2)

let availableRooms = Set([205, 411, 412])

let defaultFloat = Float()
let floatFromLiteral = Float(3.14)

let easyPi = 3.14
let floatFromDouble = Float(easyPi)
let floatingPi: Float = 3.14

countingUp.count
emptyString.isEmpty

countingUp.append("three")

var reading1: Float?
var reading2: Float?
var reading3: Float?
reading1 = 9.8
reading2 = 9.2
reading3 = 9.7

let avgReading = (reading1! + reading2! + reading3!) / 3

if let r1 = reading1,
   let r2 = reading2,
   let r3 = reading3 {
    let avgReading = (r1 + r2 + r3) / 3
} else {
    let errorString = "Instrument reported a reading that was nil."
}

if let space13Assignee = nameByParkingSpace[13] {
    print("Key 13 is assigned in the dictionary!")
}

let range = 0..<countingUp.count
for i in range {
    let string = countingUp[i]
    print(string)
}

for string in countingUp {
    print(string)
}

for (i , string) in countingUp.enumerated() {
    print(i, string)
}

for (space, name) in nameByParkingSpace.enumerated() {
    let permit = "Space \(space): \(name) "
}

// 枚举
enum PieType {
    case Apple
    case Cherry
    case Pecan
}

let favoritePie = PieType.Apple

let name: String

switch favoritePie {
case .Apple:
    name = "Apple"
case .Cherry:
    name = "Cherry"
case .Pecan:
    name = "Pecan"
}

let macOSVersion: Int = 0

switch macOSVersion {
case 0...8:
    print("A big cat")
case 9:
    print("Mavericks")
case 10:
    print("Yosemite")
case 11:
    print("El Capitan")
case 12:
    print("Sierra")
default:
    print("Greetings, people of the future! What’s new in 10.\(macOSVersion)?")
}

enum PieType1: Int {
    case Apple = 0
    case Cherry
    case Pecan
}

let pieRawValue = PieType1.Pecan.rawValue // pieRawValue值为2的Int类型
if let pieType = PieType1(rawValue: pieRawValue){
    // 获取一个有效的‘pieType’!
    print(pieType)
}
