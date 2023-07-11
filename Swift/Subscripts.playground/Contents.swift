import UIKit


// ==================================
// ✨ 서브스크립트


// 서브스크립트란 콜렉션, 리스트, 시퀀스 등 집합의 특정 멤버 엘리먼트에 간단하게 접근할 수 있는 문법

// [] 대괄호 사용


/* ============== 문법 ===============
 * 읽고-쓰기(read-write) 혹은 읽기 전용(read only)만 가능
 
subscript(index: Int) -> Int {
    get {
        // 적절한 반환 값
    }
    set(newValue) {
        // 적절한 set 액션
    }
}
*/


struct TimeTable {
    let multiplier: Int
    
    // subscript 키워드로 구현
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimeTable(multiplier: 3)
print("6 * 3 은 \(threeTimesTable[6])")  // 인스턴스 이름으로 접근



class Datas {
    var apple = ["iOS", "Mac", "Swift"]
    
    // 파라미터, 리턴형 생략 불가
    subscript(index: Int) -> String {
        get {
            return apple[index]
        }
        set {
            apple[index] = newValue
        }
    }
}


var appleLover = Datas()
appleLover.apple[0]     // iOS
appleLover[0]   // iOS(서브스크립트 구현 시 인스턴스에서 바로 접근 가능)



struct Matrix {
    // 2차원 배열
    var data = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    
    // 2개의 파라미터를 받는 읽기전용 서브스크립트의 구현
    subscript(row: Int, column: Int) -> Int? {
        if row >= 3 || column >= 3 {
            return nil
        }
        return data[row][column]
    }
}

var matt = Matrix()
matt[1, 1]      // 5 출력
