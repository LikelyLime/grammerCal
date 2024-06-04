import Foundation

//lv1
class Calculator {
    func calculate(_ oper: String ,_ firstNumber: Double ,_ secondNumber: Double ) -> Double {
        switch oper{
        case "+" :
            return firstNumber + secondNumber
        case "-" :
            return firstNumber - secondNumber
        case "*" :
            return firstNumber * secondNumber
        case "/" :
            return firstNumber / secondNumber
        case "%" ://Lv2 나머지 연산 추가
            return firstNumber.truncatingRemainder(dividingBy: secondNumber)
            
        default:
            return 0
        }
    }
}

//Lv1, Lv2 Main
let calculator = Calculator()
let addResult = calculator.calculate( "+",  3,  5)
let subtractResult = calculator.calculate( "-",  9,  3)
let multiplyResult = calculator.calculate( "*",  3,  4)
let divideResult = calculator.calculate( "/",  12,  4)
//Lv2
let remainderResult = calculator.calculate( "%",  6,  4)
print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")


//Lv3
class AddOperation {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}
class SubtractOperation {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
}
class MultiplyOperation {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}
class DivideOperation {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
}


//Lv3
class CalculatorLv3 {
    func calculate(_ oper: String ,_ firstNumber: Double ,_ secondNumber: Double ) -> Double {
        switch oper{
        case "+" :
            return AddOperation().operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case "-" :
            return SubtractOperation().operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case "*" :
            return MultiplyOperation().operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case "/" :
            return DivideOperation().operate(firstNumber: firstNumber, secondNumber: secondNumber)
        default:
            return 0
        }
    }
}
//Lv3 Main
let calculatorLv3 = CalculatorLv3(
    // 프로퍼티 초기화
)

let addResultLv3 = calculator.calculate( "+",  3,  5)
let subtractResultLv3 = calculator.calculate( "-",  9,  3)
let multiplyResultLv3 = calculator.calculate( "*",  3,  4)
let divideResultLv3 = calculator.calculate( "/",  12,  4)

print("addResultLv3 : \(addResultLv3)")
print("subtractResultLv3 : \(subtractResultLv3)")
print("multiplyResultLv3 : \(multiplyResultLv3)")
print("divideResultLv3 : \(divideResultLv3)")

//Lv4
class CalculatorLv4{//부모 추상화
    var oper: String
    init(oper: String) {
        self.oper = oper
    }
     func calculate(_ firstNumber: Double ,_ secondNumber: Double ) -> Double{
        return 0
    }
    func chngOper(_ oper: String){
        self.oper = oper
    }
}

class AbstractOperation: CalculatorLv4{//자식 구현체
    
    override func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double{
        switch super.oper{
        case "+" :
            return AddOperation().operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case "-" :
            return SubtractOperation().operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case "*" :
            return MultiplyOperation().operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case "/" :
            return DivideOperation().operate(firstNumber: firstNumber, secondNumber: secondNumber)
        default:
            return 0
        }
    }
}


let calculatorLv4: CalculatorLv4 = AbstractOperation(oper: "+")

let addResultLv4 = calculatorLv4.calculate(2, 4)// 덧셈 연산

// calculator에 뺄셈 기능하도록 프로퍼티 변경함수 호출
calculatorLv4.chngOper("-")
let subtractResultLv4 = calculatorLv4.calculate(5, 1)

// calculator에 곱셈 기능하도록 프로퍼티 변경함수 호출
calculatorLv4.chngOper("*")
let multiplyResultLv4 = calculatorLv4.calculate(5, 2)

// calculator에 나눗셈 기능하도록 프로퍼티 변경함수 호출
calculatorLv4.chngOper("/")
let divideResultLv4 = calculatorLv4.calculate(6, 4)

print("addResultLv4 : \(addResultLv4)")
print("subtractResultLv4 : \(subtractResultLv4)")
print("multiplyResultLv4 : \(multiplyResultLv4)")
print("divideResultLv4 : \(divideResultLv4)")


func mainLv4(){
    while true {
        let oper: String = readLine()!
        if oper == "break" {break}
        let firstNum: Double = Double(readLine()!)!
        let secondNum: Double = Double(readLine()!)!
        calculatorLv4.chngOper(oper)
        print(calculatorLv4.calculate(firstNum, secondNum))
        
    }
    
}
//실행 메서드
mainLv4()
