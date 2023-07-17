import UIKit


// ==================================
// MARK: - ✨ 지정 생성자 / 편의 생성자

struct ColorSet1 {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init() {
        self.init(red: 0.0, green: 0.0, blue: 0.0)
    }
    
    init(reset: Double) {
        self.init(red: reset, green: reset, blue: reset)
    }
}

let mainColor = ColorSet1()
mainColor.red   // 0

let subColor1 = ColorSet1(reset: 0.5)
subColor1.red    // 0.5

let subColor2 = ColorSet1(red: 0.1, green: 0.3, blue: 0.5)
subColor2.red   // 0.1





// 클래스에서는 convenience 키워드 필요
/** Designated initializer for 'ColorSet2' cannot delegate (with 'self.init'); did you mean this to be a convenience initializer? **/

class ColorSet2 {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    convenience init(reset: Double) {
        self.init(red: reset, green: reset, blue: reset)
    }
    
    convenience init() {
        self.init(red: 0.0, green: 0.0, blue: 0.0)
    }
}


/** 편의 생성자
  * 편의 생성자는 지정 생성자를 호출하여 사용
  * 클래스는 상속을 지원하기 때문에 여러 지정 생성자 선언 시 실수할 가능성이 있음 -> 편의 생성자로 관리
  * 지정 생성자를 호출하는 방식을 사용하여 생성자의 중복을 없애고 다른 지정 생성자를 호출하는 패턴으로 구현
 */





// ==================================
// MARK: - ✨ 클래스의 상속 && 지정 생성자 / 편의 생성자


class Aclass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    convenience init() {
        self.init(x: 0, y: 0)
    }
}


class Bclass: Aclass {
    var z: Int
    
    init(x: Int, y: Int, z: Int) {
        // 새로운 저장 속성 초기화 후
        self.z = z
        
        // 상위의 지정 생성자 호출
        super.init(x: x, y: y)
    }
    
    convenience init(z: Int) {
        self.init(x: 0, y: 0, z: z)
    }
    
    convenience init() {
        self.init(z: 0)
    }
}

let test1 = Aclass()
test1.x     // 0
let test2 = Aclass(x: 1, y: 1)
test2.x     // 1


let test11 = Bclass()
test11.x    // 0

let test22 = Bclass(x: 2, y: 2, z: 3)
test22.x    // 2



/**생성자 위임 규칙
  *델리게이트 업
  *서브클래스의 지정 생성자는 수퍼클래스의 지정 생성자를 반드시 호출
 
  *델리게이트 어크로스
  *편의 생성자는 동일한 클래스에서 지정 생성자를 호출 **/






// ==================================
// MARK: - ✨ 생성자의 상속과 재정의


/**
  * 생성자는 기본적으로 상위 클래스의 생성자를 상속하지 않고 재정의하는 것이 원칙
  * 상위 클래스의 지정 생성자와 현재 클래스의 저장 속성을 고려 **/


/**===========================================
  * [상위 지정 생성자]
  * 1. 하위 클래스에서 지정 생성자로 재정의
  * 2. 하위 클래스에서 편의 생성자로 재정의
  * 3. 재정의X
 
  * [상위 편의 생성자]
  * 재정의X

 ---------------------------------------------
 
  * [하위(현재) 지정 생성자]
  * 1. 하위의 모든 저장 속성 초기화
  * 2. 상위 클래스의 지정 생성자 호출(super.init)
 
  * [하위(현재) 편의 생성자]
  * 현재 클래스의 지정 생성자 호출
==============================================**/




class Vehicle {
    var numberOfWheels = 0
    
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
    
    // init() { }
    // -> 저장 속성에 기본값이 있고, 따로 생성자를 구현하지 않았기 때문에 기본 생성자 자동 구현
}


class Bicycle: Vehicle {
    
    override init() {
        super.init()
        numberOfWheels = 2
    }
    
    // -> 새로운 저장 속성이 없기 때문에 상위 지정 생성자 호출하여 메모리 초기화 후,
    // 상위에서 구현한 속성에 접근하여 값 변경
}


class Taxi: Vehicle {
    var color: String
    
    override init() {
        color = "yellow"
        super.init()
    }
    // -> 상위 클래스 구현에 init()만 있는 경우 생략 가능(암시적 요청)
    
    init(color: String) {
        self.color = color
        super.init()
        numberOfWheels = 4
    }
}

let myTransfer = Taxi()
myTransfer.color        // yellow
myTransfer.numberOfWheels   // 0

let myTransfer2 = Taxi(color: "black")
myTransfer2.color       // black
myTransfer2.numberOfWheels  // 4






// ==================================
// MARK: - ✨ 생성자의 자동 상속

// 1. 하위 클래스에서 새로운 저장 속성이 없거나, 기본값이 설정되어 있다면
// -> 상위 클래스의 지정 생성자 모두 자동 상속

// 2. 지정 생성자로 자동 상속하는 경우 / 상위 지정 생성자를 모두 재정의하는 경우
// -> 상위 클래스의 편의 생성자 모두 자동 상속


class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "Untitled")
    }
}


class Recipe: Food {
    var quantity: Int
    
    // 모든 속성 초기화
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    // 상위 지정 생성자를 편의 생성자로 재정의
    override convenience init(name: String) {
        self.init(name: name, quantity: 0)
    }
}


class ShoppingList: Recipe {
    var isPurchased = false
    
    // init(name: String, quantity: Int) {}
    // convenience init(name: String) {}
    // convenience init() {}
}
