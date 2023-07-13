import UIKit

// ==================================
// ✨ 싱글톤 패턴

// 유일하게 1개만 존재하는 객체
// 한 번 생성된 이후에는 앱이 종료될 때까지 유일한 객체로 메모리에 상주

// 구현방법
// static let 이름 = 객체생성()



class Managers {
    // 객체를 생성해서 전역변수에 할당
    static let shared = Managers()
    var userID = "유저ID"
    
    // 외부에서 새로운 객체 생성을 금지하고 싶은 경우 구현
    private init() {}
    
    func changeUserId(name: String) {
        self.userID = name
    }
}

// 싱글톤 패턴으로 구현된 객체는 변수로 접근할 때 메모리 영역을 가짐
let user1 = Managers.shared
user1.userID = "yeonsu"

Managers.shared.userID
user1.userID

let user2 = Managers.shared
user2.userID    // user1과 마찬가지로 유일한 객체를 가리킴


