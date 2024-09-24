struct JuiceMaker {
    private let fruitStore = FruitStore()
    private var juice: Juice?
    
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
        case .none:
            return [:]
        }
        
    }

    mutating func makeJuice(for selectedJuice: Juice) -> Result<Juice, Error>{
        self.juice = selectedJuice
        
        do {
            for (fruit, amount) in recipe {
                try fruitStore.isFruitAvailable(fruit, amount)
                fruitStore.updateFruitStock(fruit: fruit, amount: amount)
            }
            return .success(selectedJuice)
        } catch {
            return .failure(error)
        }
    }
    
}
