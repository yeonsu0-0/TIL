import UIKit


// ==================================
// ✨ 인스턴스 메서드

struct User {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sayHello() {   // 인스턴스 메서드
        print("방가방가 \(name)")
    }
    
    // 구조체!!!!에서는 속성을 변경하는 함수 작성 시 mutating 키워드 필수
    // 속성을 변경할 것임을 알려주는 키워드
    mutating func changeName(newName: String) {
        self.name = newName
    }
}

var yeonsu = User(name: "연수", age: 25)
yeonsu.sayHello()
yeonsu.changeName(newName: "연두")
yeonsu.name





// ==================================
// ✨ 타입 메서드

class User2 {
    static var name: String = "유저"
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
    
    func sayHello() {
        print("방가방가 \(User2.name)")     // 타입 메서드 접근
    }
    
    // static 키워드: 상속 시 재정의 불가
    // class 키워드: 상속 시 재정의 가능
    static func changeName(newName: String) {
        self.name = newName
    }
}

var profile = User2(age: 24)
