import UIKit

// MARK: - Calendar 구조체
// 절대 시점(Date())을 연도/날짜/요일과 같은 달력 요소로 변환해주는 객체

var calendar = Calendar.current // .current: 그레고리력(양력)




// MARK: - 지역 설정
calendar.locale     // 달력 표기방법(영어, 한국어, ...)
calendar.timeZone   // Asia/Seoul(UTC 시간 관련)

calendar.locale = Locale(identifier: "ko_KR")

/*
 - 지역설정 문자열: https://gist.github.com/xta/6e9b63db1fa662bb3910b680f9ebd458
 - 타임존 문자열: https://gist.github.com/mhijack/2b63b84d96802ccc719291474ac9df72
*/




let now = Date()



// 날짜: 년 / 월 / 일
let year: Int = calendar.component(.year, from: now)
let month: Int = calendar.component(.month, from: now)
let day: Int = calendar.component(.day, from: now)

// 시간: 시 / 분 / 초
let hour: Int = calendar.component(.hour, from: now)
let minute: Int = calendar.component(.minute, from: now)
let second: Int = calendar.component(.second, from: now)

// 요일
let weekday: Int = calendar.component(.weekday, from: now)
// 요일의 경우 일요일부터 1, 2, 3, ... 숫자로 반환

print("\(year)년 \(month)월 \(day)일")




// MARK: - 여러 개의 데이터 얻는 방법
var myData = calendar.dateComponents([.year, .month, .day], from: now)

myData.year
myData.month
myData.day




// MARK: - 현재 달력을 기준으로 나이 계산하기
class humanInfo {
    var name: String
    var birth: Int
    
    init(name: String, birth: Int) {
        self.name = name
        self.birth = birth
    }
    
    var age: Int {
        get {
            let now = Date()
            let year = calendar.component(.year, from: now)
            return year - birth
        }
    }
}

let yeonsu = humanInfo(name: "연수", birth: 1999)
yeonsu.age




// MARK: - 열거형으로 요일 만들고 계산하기
enum WeekDay: Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    
    // 타입 계산속성
    static var today: WeekDay {
        let weekday: Int = Calendar.current.component(.weekday, from: Date())
        return WeekDay(rawValue: weekday)!
    }
}

let today = WeekDay.today
