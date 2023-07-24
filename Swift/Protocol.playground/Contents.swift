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
