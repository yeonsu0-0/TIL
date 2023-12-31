import UIKit



// ==================================
// MARK: - ✨ is 연산자
// 타입 체크 연산자

class Book {
    var name: String
    var author: String
    
    convenience init() {
        self.init(name: "무제", author: "미상")
    }
    
    init(name: String, author: String) {
        self.name = name
        self.author = author
    }
}

class Library: Book {
    var space: String
    var section: String
    
    convenience init() {
        self.init(name: "무제", author: "미상", space: "0", section: "0")
    }
    
    init(name: String, author: String, space: String, section: String) {
        self.space = space
        self.section = section
        super.init(name: "", author: "")
    }
}


let operatingSystem = Book(name: "운영체제", author: "황기태")
let myBook = Library(name: "자료구조",author: "이석호", space: "100", section: "3")


operatingSystem is Book         // true
myBook is Book                  // true
operatingSystem is Library      // true
myBook is Library               // true







// ==================================
// MARK: - ✨ as 연산자
// 인스턴스 타입의 힌트를 변경하는 연산자

/*
 ex. Person(), Student: Person(), Undergraduate: Student()가 있다고 가정
 
 [업캐스팅] as
 
 Undergraduate -> Person
 타입 캐스팅 항상 성공
 
 -------------------------------------
 
 [다운캐스팅] as? / as!
 
 Person -> Undergraduate
 실패 가능성을 가지고 있음, as?의 경우 값에 따라 Optional 타입 또는 nil 리턴
 Optional 타입 강제 언래핑
 
 
 -------------------------------------
 
 let person: Person = Undergraduate()
 if let newPerson = person as? Undergraduate {...}
 person이라는 변수의 타입을 Undergraduate 타입으로 변환
 
 */



let myFavoriteBook: Book = Library()
// 4개의 저장 속성을 갖고 있지만 Book 클래스의 저장 속성(2개)에만 접근 가능
// myFavoriteBook.space -> 접근 불가, 에러 발생

if let newBook = myFavoriteBook as? Library {
    print("다운캐스팅 성공")
}





// ==================================
// MARK: - ✨ Any / AnyObject 타입 캐스팅

/**
 * Any
 * 어떤 타입의 인스턴스도 표현할 수 있는 타입
 *
 * AnyObject
 * 어떤 클래스 타입의 인스턴스도 표현할 수 있는 타입
 *
 * Any / AnyObject -----> String, Int, ... 는 다운 캐스팅 (as? / as!)
 * String, Int, ...  -----> Any / AnyObject 는 업캐스팅(as)
 */



// switch문과 타입 캐스팅 연산자의 활용

class Person {
    var name: String = "이름을 입력하세요"
}

let array: [Any] = [5, 1.5, "Hello, world!", Person(), {(name: String) in return name}]

(array[1] as! Double).isZero


for (index, item) in array.enumerated() {
    switch item {
    case is Int:
        print("\(index): 정수입니다.")
    case is Double:
        print("\(index): Double형입니다.")
    case _ as String:
        print("\(index): 문자열입니다.")
    default:
        print("\(index): 기타 타입입니다.")
    }
}
