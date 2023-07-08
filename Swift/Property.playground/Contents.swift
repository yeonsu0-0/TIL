import UIKit

// ==================================
// ✨ 저장 속성

// 1. 각 인스턴스가 메모리 공간을 차지해서 가지는 데이터 저장 공간
// 2. 객체 초기화 시 반드시 값 지정(기본값, 생성자, 옵셔널 타입 지정 등)

struct Bird {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let coco = Bird(name: "coco", age: 2)
coco.name     // coco
coco.age      // 2






// ==================================
// ✨ 지연 저장 속성
// lazy

// 1. 초기화를 지연시킴
//    - 메모리 공간 낭비X
//    - 지연 저장 속성으로 선언된 속성이 다른 저장 속성에 의존하는 경우

// 2. 인스턴스 생성X, 접근 시 메모리 공간 생성
// 3. 선언할 때 기본값 설정 필요(생성자에서 설정하는 것은 의미없음)

struct Dog {
    var birth: Int
    lazy var age: Int = 25
    
    init(birth: Int) {
        self.birth = birth
    }
}

var sky = Dog(birth: 2019)
sky.age     // 25
sky.birth   // 2019





// ==================================
// ✨ 계산 속성
// getter / setter

struct Human {
    var height: Double
    var weight: Double
    
    // 계산 속성
    // return값 존재
    // getter 필수 구현, setter 생략 가능
    var bmi: Double {
        get {
            return weight / (height * height) * 10000
        }
        set(newValue) {
            weight = newValue * (height * height) / 10000
        }
    }
}

// 계산 속성 접근 방법
var man1 = Human(height: 183, weight: 75)
man1.bmi         // get
man1.bmi = 20.0  // set(weight값 변경)

man1.weight     // 66.978

// 계산 속성은 메서드!!
// 메모리 공간을 가지지 않고, 속성에 접근했을 때 계산한 뒤 그 결과를 리턴하거나 세팅하는 메서드






// ==================================
// ✨ 타입 속성
// static

// 타입 자체에 속한 속성으로 Type.property로 접근

class Circle {
    // 저장 타입 속성(지연 속성의 성격을 가짐 - 접근 시 메모리 공간 차지)
    static let pi: Double = 3.14
    static var count: Int = 0   // 인스턴스 갯수 확인
    
    // 저장 속성
    var radius: Double
    
    // 계산 속성
    var diameter: Double {
        get {
            return radius * 2
        }
        set(newValue) {
            radius = newValue / 2
        }
    }
    
    // 계산 타입 속성
    static var multiplePi: Double {
        return pi * pi  // ** 타입에 속해있기 때문에 타입 생략 가능
    }
    
    // 생성자
    init(radius: Double) {
        self.radius = radius
        Circle.count += 1   // 생성자에서 타입 속성에 접근하는 경우 인스턴스에 속해있기 때문에 Circle.count와 같이 타입 생략 불가
    }
}

let myCircle = Circle(radius: 5)
myCircle.diameter   // 10
myCircle.radius     // 5
Circle.count        // 1

let secondCircle = Circle(radius: 3)
Circle.count        // 2







// ==================================
// ✨ 속성 감시자
// willSet / didSet

// 변수가 변했을 때 업데이트하려는 패턴에서 사용

struct User {
    var name: String
    var message: String {
        willSet {
            print("\(message)에서 \(newValue)로 변경될 예정입니다")
        }
        didSet {
            print("\(oldValue)에서 \(message)로 이미 변경되었습니다")
        }
    }
    init(name: String, message: String) {
        self.name = name
        self.message = message
    }
}

var yeonsuProfile = User(name: "yeonsu", message: "안녕하소")
yeonsuProfile.name
yeonsuProfile.message

yeonsuProfile.message = "할로 ㅎㅇㅎㅇ"

