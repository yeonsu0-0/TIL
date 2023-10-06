


// ==================================
// MARK: - ✨ 클로저
// 이름이 없는 (익명) 함수


// 기존 함수의 형태
func myFunction() -> Int {
    var num = 4
    return num
}

// 클로저
var closure = { () -> Int in
    var num = 5
    return num
}


/* 일급 객체의 의미
 * 함수를 변수에 할당할 수 있음
 * 함수를 호출할 때 함수를 파라미터로 전달할 수 있음
 * 함수의 반환값으로 함수 가능
 */


// MARK: - ✨ 클로저의 형태
/*
 { (파라미터) in
    ...
    return ...
 }
 */



// MARK: - ✨ 클로저와 콜백함수
// 콜백함수: 함수를 호출하면서 파라미터로 전달하는 함수

// #1. closure 매개변수로 받는 함수 정의
func closureParamFunction(closure: () -> Void) {
    print("Hello World!@")
    closure()
}

// #2. 함수 호출 시 closure 함수 전달
closureParamFunction(closure: {
    print("Good-bye World!")
})



// MARK: - ✨ 후행 클로저(Trailing closure)
closureParamFunction(closure: {
    print("Good-bye World!")
})

// =====> 후행 클로저 형태로 표현
closureParamFunction {
    print("Good-bye World!")
}   // 기존 함수 실행은 ()라면 클로저는 {} 구나!



// MARK: - ✨ 파라미터 간소화
var simpleParam = {(param) in
    return param % 2 == 0
}

// =====> 간소화
simpleParam = { $0 % 2 == 0 }



// MARK: - ✨ 클로저의 메모리 구조
// 참조 타입
// 메모리의 주소를 힙(Heap)에 저장하고 실제 실행은 스택(Stack)에서 동작!



// MARK: - ✨ 클로저의 캡쳐현상

var stored = 0

let closureCaptured = { (number: Int) -> Int in
    stored += number
    return stored
}

closureCaptured(4)  // 4
closureCaptured(5)  // 9
closureCaptured(6)  // 15

// 힙에 저장되는 클로저에는 closureCaptured 함수의 메모리 주소와 stored 변수 주소를 저장(캡쳐)



// MARK: - ✨ @escaping 키워드
// 클로저의 실행이 본래 함수를 벗어나서도 실행되도록 하는 키워드

// 내부 클로저를 외부 변수에 저장할 때
var aFunc = { print("출력") }

func bFunc(closure: @escaping () -> ()) {
    aFunc = closure
}

aFunc()
bFunc(closure: { print("출력했어요") })
aFunc()



// MARK: - ✨ @autoclosure 키워드
// 함수 실행 시 클로저 형태로 전달하지 않아도 자동으로 클로저로 만들어주는 키워드

func someFunc(closure: @autoclosure () -> Bool) {
    if closure() {
        print("참이요")
    } else {
        print("거짓이요")
    }
}

var isTrue = true

// someFunc(closure: { isTrue == true })
someFunc(closure: isTrue == true)  // autoclosure 키워드를 사용하면 중괄호 생략O
