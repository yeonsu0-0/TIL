import UIKit

// 230627
// 제네릭(Generics)

// 💡 제네릭을 사용하면 한 번의 구현으로 모든 타입을 사용할 수 있다.
// 유지보수, 재사용성 Good


// 예를 들어 기존 swap 함수를 구현할 때, Int, String, ... 등의 파라미터 타입을 지정해야 한다.
var a = 10
var b = 20

func swap(num1: inout Int, num2: inout Int) {   // inout: 파라미터의 원본 전달
    var temp = num1
    num1 = num2
    num2 = temp
}

swap(&a, &b)

print(a)
print(b)


// 제네릭을 이용하는 경우
var aa = "a"
var bb = "b"

func swapGeneric<T>(parm1: inout T, parm2: inout T) {
    var temp = parm1
    parm1 = parm2
    parm2 = temp
}

swapGeneric(parm1: &a, parm2: &b)
swapGeneric(parm1: &aa, parm2: &bb)

print(a)
print(b)
print(aa)
print(bb)



// 다른 예시
let numbers = [1, 2, 3, 4, 5]
let alphabets = ["a", "b", "c"]

func printArray<T>(array: [T]) {
    for i in array {
        print(i)
    }
}

printArray(array: numbers)
printArray(array: alphabets)



// 구조체로 제네릭 정의
struct GenericStruct<T> {
    var gsStruct: [T] = []
}

var gs1 = GenericStruct(gsStruct: [1, 2, 3])
var gs2 = GenericStruct(gsStruct: ["1", "2", "3"])


// 클래스로 제네릭 정의
class GenericClass<T> {
    var x: T
    var y: T
    
    init(x: T, y: T) {
        self.x = x
        self.y = y
    }
}

let gc1 = GenericClass(x: 10, y: 10)
let gc2 = GenericClass(x: 10.1, y: 10.2)


// 열거형으로 제네릭 정의
enum GenericEnum<T> {
    case americano
    case latte
    case dessert(T) // 연관값을 가질 때 제네릭으로 정의 가능)
}

let ge = GenericEnum.dessert("케이크")
