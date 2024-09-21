struct JuiceMaker {
    private let fruitStore = FruitStore()
    private let juice: Juice
    
    var recipe: [Fruit: Int] {
        switch juice {
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
}
