class ReversePolishNotation {
    
    func calculate(expression: String) -> String {
        
        var numbers = [Double]()
        var symbols = [String]()
        let array = expression.split(separator: " ")
        
        for i in 0..<array.count {
            if let n = Double(array[i]) {
                numbers.append(n)
            }
            else {
                if symbols.isEmpty {
                    symbols.append(String(array[i]))
                } else {
                    if mathSignPriority(symbols.last!) < mathSignPriority(String(array[i])) {
                        symbols.append(String(array[i]))
                    } else {
                        guard numbers.count > 1 else { return "" }
                        let den = numbers.popLast() ?? 0
                        let num = numbers.popLast() ?? 0
                        let symbol = symbols.popLast() ?? ""
                        let total = calculating(num, den, symbol)
                        symbols.append(String(array[i]))
                        numbers.append(total)
                    }
                }
            }
        }
        while numbers.count != 1 {
            let den = numbers.popLast() ?? 0
            let num = numbers.popLast() ?? 0
            let symbol = symbols.popLast() ?? ""
            let total = calculating(num, den, symbol)
            numbers.append(total)
        }
        return "\(numbers.first!)"
    }
    
    func mathSignPriority(_ symbol: String) -> Int {
        switch symbol {
        case "/":
            return 2
        case "*":
            return 2
        case "+":
            return 1
        case "-":
            return 1
        default:
            return 0
        }
    }
    
    func calculating(_ num: Double, _ den: Double, _ symbol: String) -> Double {
        switch symbol {
        case "/":
            return num / den
        case "*":
            return num * den
        case "-":
            return num - den
        case "+":
            return num + den
        default:
            return 0
        }
    }
}

