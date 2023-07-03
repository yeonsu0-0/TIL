import UIKit



// DataFormatter
// 날짜와 시간을 원하는 형식의 문자열로 변환하는 방법을 제공하는 클래스
// 유니코드 기준으로 작성!


// ================================================
// 💡 Date()를 특정 형식의 문자열로 변환
// [지역 - 시간대 - 날짜 - 시간] 형식 지정하기

// 0. 객체 생성
let formatter = DateFormatter()

// 1. 지역 설정
formatter.locale = Locale(identifier: "ko_KR")  // 나라/지역마다 형식과 언어가 다름

// 2. 시간대 설정
formatter.timeZone = TimeZone.current

// 3. 날짜 설정
formatter.dateStyle = .full

// 4. 시간 설정
formatter.timeStyle = .full


let basicFormat = formatter.string(from: Date())
print(basicFormat)   // 2023년 7월 3일 월요일 오전 11시 35분 33초 대한민국 표준시



// ================================================
// 💡 커스텀 형식 지정
formatter.dateFormat = "yyyy년 MM월 dd일 (E)"

let customFormat = formatter.string(from: Date())
print(customFormat)  // 2023년 07월 03일 (월)



// ================================================
// 💡 문자열 형식에서 Date()로 변환하기

let formatterToDate = DateFormatter()
formatterToDate.dateFormat = "yyyy년 MM월 dd일"

let stringToDate = formatterToDate.date(from: "2022년 08월 14일")!
print(stringToDate)     // 2022-08-13 15:00:00 +0000



// ================================================
// 💡 프로젝트 활용 예시
struct blogPost {
    let title: String = "제목"
    let script: String = "내용"
    
    private let date: Date = Date()
    
    // Date() -> String 변환
    var dateToString: String {
        get {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            
            return formatter.string(from: date)
        }
    }
}

let firstPost = blogPost()
print(firstPost.dateToString)   // 2023. 7. 3. 오전 11:43
