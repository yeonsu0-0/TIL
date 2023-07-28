import UIKit

// ==================================
// MARK: - ✨ 프로토콜 확장


protocol Remote {
    func turnOn()
    func turnOff()
}

// 프로토콜의 확장은 기본값(디폴트값) 구현하는 것 !!!
// 프로토콜을 채택한 모든 타입에서 구현을 반복해야하는 번거로움 -> 확장으로 디폴트값 구현하자!

extension Remote {
    func turnOn() { print("전원 ON") }
    func turnOff() { print("전원 OFF") }
    func doAction() { print("리모콘 동작") } // Direct Dispatch
}


class SmartCar: Remote {
    func turnOn() { print("시동 걸기") }
    func doAction() { print("자동차 동작") }
}


let myCar: SmartCar = SmartCar()
myCar.turnOn()      // 시동 걸기    목격자 테이블
myCar.turnOff()     // 전원 OFF    목격자 테이블
myCar.doAction()    // 자동차 동작   목격자 테이블


let myCar2: Remote = SmartCar()
myCar2.turnOn()     // 시동 걸기    목격자 테이블
myCar2.turnOff()    // 전원 OFF    목격자 테이블
myCar2.doAction()   // 리모콘 동작.  Direct dispatch






