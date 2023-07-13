import UIKit


// ==================================
// ✨ 재정의


/** 속성 재정의
 * 저장 속성은 원칙적으로 재정의 불가(메모리 구조가 변경되기 때문)
 * 메서드 형태로 추가하는 재정의는 가능(속성 감시자, 계산 속성, ...) */

/** 계산 속성 재정의
 * 실질적인 메서드 -> 메서드 형태로만 재정의 가능
 * 읽기(상위) -> 읽기/쓰기(하위)
 * 읽기/쓰기(상위) -> 읽기(하위) 전용으로 구현 불가 */


class Vehicle {
    var speed: Double = 0.0
    var twiceSpeed: Double {
        get {
            return speed * 2
        }
        set {
            speed = newValue * 2
        }
    }
}

class Taxi: Vehicle {
    var limousine: Bool = false
    
    // 계산 속성으로 재정의(super 키워드 유의)
    override var speed: Double {
        get {
            return super.speed
        }
        set {
            super.speed = newValue
        }
    }
    
    // 속성 감시자 추가
    override var twiceSpeed: Double {
        willSet {
            print("값이 \(speed)에서 \(newValue)로 변경 예정")
        }
        didSet {
            print("값이 \(oldValue)에서 \(speed)로 변경 예정")
        }
    }
}


var myTransfer = Taxi()
myTransfer.limousine    // false
myTransfer.speed = 2.1
myTransfer.twiceSpeed   // 4.2
myTransfer.twiceSpeed = 3   // 값이 2.1에서 3.0로 변경 예정, 값이 4.2에서 6.0로 변경 예정
