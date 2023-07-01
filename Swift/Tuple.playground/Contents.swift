import UIKit

// 튜플
// 2개 이상의 타입이 정해져 있지 않은 연관 데이터를 저장하는 compound 타입

var humanInfo = ("홍길동", 20, "서울")      // 멤버(데이터의 종류 및 갯수)는 튜플을 만들때 결정되므로 "추가"/"삭제" 불가



// 튜플 데이터에 접근
humanInfo.0
humanInfo.1
humanInfo.2



// Named Tuple
let iOS = (language: "Swift", version: 5)

iOS.0
iOS.1

iOS.language
iOS.version



// 튜플의 분해
let(first, second, third) = humanInfo
first   // 홍길동
second  // 20
third   // 서울



// 튜플의 매칭
if iOS.language == "Swift" && iOS.version == 5 {
    print("iOS 버전 5입니다")
}

if iOS == ("Swift", 5) {
    print("iOS 버전 5입니다")
}



// 💡 튜플은 switch문과 자주 활용된다
switch iOS {
case ("Swift", 5):
    print("Swift 버전 5입니다")
case ("Swift", 4):
    print("Swift 버전 4입니다")
default:
    break
}



// 튜플의 바인딩
var coordinate = (0, 5)

switch coordinate {
case (let distance, 0), (0, let distance):
    print("X 또는 Y축 위에 위치하며, \(distance)만큼의 거리가 떨어져 있음")
default:
    print("축 위에 있지 않음")
}

// where절 활용
switch coordinate {
case (let x, let y) where x == y:
    print("(\(x), \(y))의 좌표는 y = x 1차함수의 그래프 위에 있다.")
    
case let (x, y) where x == -y:
    print("(\(x), \(y))의 좌표는 y = -x 1차함수의 그래프 위에 있다.")
    
case let (x, y):
    print("(\(x), \(y))의 좌표는 y = x, 또는 y = -x 그래프가 아닌 임의의 지점에 있다.")
}
