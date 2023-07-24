import UIKit

// ==================================
// MARK: - ✨ 확장

/** 확장의 개념
  * 상속: 성격이 비슷한 클래스를 새로 만들어서 속성을 추가하거나 메서드를 변형해서 사용하려는 목적
  * 확장: 현재 존재하는 타입에 메서드를 추가해서 사용하려는 목적
  */

// 확장은 왜 사용할까?
// 원본 소스코드에 대해 액세스 권한이 없는 유형을 확장하는 기능(소급 모델링)
// Apple이 제공하는 Int, String, Double과 같은 타입에 확장 가능


class Exam {
    var Korean = "국어"
    var English = "영어"
    
    func test() {
        print("시험")
    }
}

extension Exam {
    // 기존 타입명 앞에 extension 키워드를 추가하고, 새로운 기능 추가
    func project() {
        print("대체 과제")
    }
}

class Student: Exam {
    var favoriteSubject = "미정"
    
    override func test() {
        print("학생이 시험을 응시합니다")
    }
    
    func homework() {
        print("수행평가를 합니다")
    }
}

class Undergraduate: Student {
    var major = "전공"
    
    override func test() {
        print("대학생이 시험을 응시합니다")
    }
    
    override func homework() {
        print("과제를 합니다")
    }
    
    // 📛 Non-@objc instance method 'project()' is declared in extension of 'Exam' and cannot be overridden
    // 확장에서 구현한 메서드는 재정의를 할 수 없다!
    
//    override func project() {
//        print("대체 과제를 합니다")
//    }
}



// Int 확장
extension Int {
    var squared: Int {
        return self*self
    }
}

5.squared   // 25




// ==================================
// MARK: - ✨ 확장의 종류

// MARK: - 1. 인스턴스 계산 속성
extension Double {
    var m: Double { return self }
    var km: Double { return self * 1000.0 }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm   // 0.0254
let threeFeet = 3.ft    // 0.914399970739201

// 인스턴스 자체에 .문법을 사용하여 거리 변환

let aMarathon = 42.km + 195.m



// MARK: - 2. 타입 계산 속성
extension Double {
    static var zero: Double { return 0.0 }
}



// ** 확장과 함수 생성의 비교
extension Int {
    var squaredInt: Int {
        return self * self
    }
}

3.squaredInt

func squaredInt(num: Int) -> Int {
    return num * num
}

squaredInt(num: 3)




// MARK: - 3. 타입 메서드
extension Int {
    static func printNum1to5() {
        for i in 1...5 {
            print(i)
        }
    }
}

Int.printNum1to5()



// MARK: - 4. 인스턴스 메서드
extension String {
    func printHelloRepetitions(of times: Int) {
        for _ in 0..<times {
            print("Hello \(self)!")
        }
    }
}

"yeonsu".printHelloRepetitions(of: 5)




// MARK: - 5. mutating 인스턴스 메서드

// 구조체 또는 열거형에서 자신의 속성을 변경하는 메서드는 mutating 키워드 필요
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()





// MARK: - 6. 멤버의 확장(생성자)

/**
  * [클래스]
  * 편의 생성자(convenience init())만 구현 가능(본체의 지정 생성자를 호출하는 방식)
  * 지정 생성자 및 소멸자 추가 불가
 
  * [구조체]
  * 구조체는 원래 편의 생성자가 존재하지 않고, 상속과도 관련 없기 때문에 지정 생성자의 형태로도 자유롭게 생성자 구현 가능
  * convenience 키워드는 불필요하지만, 편의 생성자와 같은 방식으로 본체의 지정 생성자를 호출해야함
  * 본체에 직접 생성자를 구현하는 경우, 기본 생성자 init()과 멤버와이즈 생성자는 제공되지 않는 것이 원칙
  * (예외) 본체의 모든 저장 속성에 기본값을 주거나, 본체에 생성자를 구현하지 않았다면 확장에서 생성자를 구현하더라도 본체에는 여전히 기본 생성자 및 멤버와이즈 생성자가 자동으로 제공된다
 **/


// 구조체 예시
struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()    // 기본 생성자
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
                          size: Size(width: 5.0, height: 5.0))  // 멤버와이즈 생성자

extension Rect {
    // 센터값으로 Rect 생성하는 생성자 만들기
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        
        // -> origin 값을 center로 변경한 것
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))



// 클래스 예시
var color = UIColor(red: 0.3, green: 0.5, blue: 0.4, alpha: 1)

extension UIColor {
    convenience init(color: CGFloat) {
        self.init(red: color/255, green: color/255, blue: color/255, alpha: 1)
    }
}

UIColor(color: 1)





// MARK: - 7. 멤버의 확장(서브스크립트)

// 확장으로 서브스크립트 추가 가능
// 기본 자리수의 n자리 십진수 반환하기

extension Int {
    subscript(num: Int) -> Int {
        var decimalBase = 1
        
        // 자리수 만큼 10 곱하기
        for _ in 0..<num {
            decimalBase *= 10
        }
        
        return (self / decimalBase) % 10
    }
}

123456789[0]    // 9





// MARK: - 8. 멤버의 확장(중첩타입)

// 클래스, 구조체, 열거형에 새로운 중첩 유형을 추가할 수 있다

extension Int {
    enum Kind {
        case negative
        case zero
        case positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return Kind.zero
        case let x where x > 0:
            return Kind.positive
        default:
            return Kind.negative
        }
    }
}
    
let a = 0
a.kind

Int.Kind.negative
Int.Kind.positive
Int.Kind.zero

func printIntegerType(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("-", terminator: "\n")
        case .zero:
            print("0", terminator: "\n")
        case .positive:
            print("+", terminator: "\n")
        }
    }
}

printIntegerType([1, 0, -25, 4, -6, 2, 9])
