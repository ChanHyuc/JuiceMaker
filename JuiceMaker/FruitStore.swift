protocol FruitDelegate: AnyObject {
    func updateFruits(_ fruits: (strawberry: Int, banana: Int, pineapple: Int, kiwi: Int, mango: Int))
}

class FruitStore {
//    private var fruits: (strawberry: Int, banana: Int, pineapple: Int, kiwi: Int, mango: Int) = (10, 11, 12, 13, 14)
    
    private var fruitStock: [Fruit: Int] = [.strawberry: 20, .banana: 21, .pineapple: 22, .kiwi: 23, .mango: 24]
    
    func printFruit(_ fruit: Fruit) -> String {
        if let stock = fruitStock[fruit] {
            switch fruit {
            case .strawberry :
                return String(stock)
            case .banana:
                return String(stock)
            case .pineapple:
                return String(stock)
            case .kiwi:
                return String(stock)
            case .mango:
                return String(stock)
            }
        }
        return ""
    }
            
//    func useFruit(for juice: String) throws {
//        switch juice {
//        case "딸기쥬스":
//            guard fruits.strawberry - 16 >= 0 else {
//                throw JuiceMakerError.outOfStock
//            }
//            fruits.strawberry -= 16
//            
//        case "바나나쥬스":
//            guard fruits.banana - 2 >= 0 else {
//                throw JuiceMakerError.outOfStock
//            }
//            fruits.banana -= 2
//            
//        case "키위쥬스":
//            guard fruits.kiwi - 3 >= 0 else {
//                throw JuiceMakerError.outOfStock
//            }
//            fruits.kiwi -= 3
//            
//        case "파인애플쥬스":
//            guard fruits.pineapple - 2 >= 0 else {
//                throw JuiceMakerError.outOfStock
//            }
//            fruits.pineapple -= 2
//            
//        case "망고쥬스":
//            guard fruits.mango - 3 >= 0 else {
//                throw JuiceMakerError.outOfStock
//            }
//            fruits.mango -= 3
//            
//        case "딸바쥬스":
//            guard fruits.strawberry - 10 >= 0 && fruits.banana - 1 >= 0 else {
//                throw JuiceMakerError.outOfStock
//            }
//            fruits.strawberry -= 10
//            fruits.banana -= 1
//            
//        case "망키쥬스":
//            guard fruits.mango - 2 >= 0  && fruits.kiwi - 1 >= 0 else {
//                throw JuiceMakerError.outOfStock
//            }
//            fruits.mango -= 2
//            fruits.kiwi -= 1
//        default: break
//        }
//    }
    
}


//func printStrawberry() -> String {
//    return String(fruits.strawberry)
//}
//
//func printBanana() -> String {
//    return String(fruits.banana)
//}
//
//func printPineapple() -> String {
//    return String(fruits.pineapple)
//}
//
//func printKiwi() -> String {
//    return String(fruits.kiwi)
//}
//
//func printMango() -> String {
//    return String(fruits.mango)
//}
