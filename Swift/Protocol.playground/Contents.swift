import UIKit


// ==================================
// MARK: - ✨ 프로토콜

// 최소한의 요구사항 나열

/** 1. 속성 요구사항 정의
 
  * 속성의 뜻에서 var로 선언(let 선언 불가)
  * get / set 키워드로 읽기 / 쓰기 여부 결정
  * 저장 / 계산 속성으로 모두 구현 가능
 
**/

protocol RemoteMouse {
    var id: String { get }
    var name: String { get set }
    static var type: String { get set }
}


struct TV: RemoteMouse {
    static var type: String = "리모콘"
    var seller: String = "판매자"
    var id: String = "4, 5, 6"
    var name: String {
        get {
            return "삼성"
        }
        set {
            
        }
    }
}

var myTV = TV()
myTV.id
myTV.id = "7, 8, 9"
myTV.id

myTV.name
myTV.name = "Jay "
myTV.name




/** 2. 메서드 요구사항 정의
 
  * 메서드의 헤드부분을 정의
  * mutating, static, class 키워드의 사용법
 
  * 생성자 요구사항
  * 클래스에서 생성자 채택할 경우 required 키워드 필수(final로 선언 시 생략 가능)
  * 지정 생성자 / 편의 생성자로 구현 가능
  * init? -> init / init? / init! 으로 구현 가능
 
**/


protocol Toggled {
    mutating func toggle()
}

struct SwitchSetting {
    var isOn = true
    
    mutating func toggle() {
        isOn = isOn ? false : true
    }
}

var settingSwitchButton = SwitchSetting()

settingSwitchButton.isOn    // true
settingSwitchButton.toggle()
settingSwitchButton.isOn    // false



protocol DataList {
    subscript(index: Int) -> Int { get }
}

struct DataStructure: DataList {
    subscript(index: Int) -> Int {
        get {
            return 0
        }
        set {
            
        }
    }
}
