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
