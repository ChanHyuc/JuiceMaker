struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    enum Juice: String {
        case strawberryJuice = "딸기쥬스"
        case bananaJuice = "바나나쥬스"
        case kiwiJuice = "키위쥬스"
        case pineappleJuice = "파인애플쥬스"
        case mangoJuice = "망고쥬스"
        case strawberryBananaJuice = "딸바쥬스"
        case mangoKiwiJuice = "망키쥬스"
    }
    
    var recipe: [Fruit: Int] {
        switch Juice {
        case .strawberryJuice:
            return [.strawberry: 6]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 4]
        case .mangoJuice:
            return [.mango: 5]
        case .strawberryBananaJuice:
            return [.strawberry: 5, .banana: 5]
        case .mangoKiwiJuice:
            return [.mango: 5, .kiwi: 5]
        }
    }
    
//    func makeJuice(for juice: Juice) -> Result<Juice, Error> {
//        try fruitStore.checkFruitStock(fruit: juice, amount: <#T##Int#>)
//    }
}
