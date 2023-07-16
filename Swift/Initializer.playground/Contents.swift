import UIKit


// ==================================
// ✨ 지정 생성자 / 편의 생성자

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
// ✨ 클래스의 상속 && 지정 생성자 / 편의 생성자


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

