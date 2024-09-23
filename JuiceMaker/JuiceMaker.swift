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
    
    func checkFruitStock(fruit: Fruit, amount: Int) throws {
        guard let currentStock = fruitStock[fruit], currentStock >= amount else {
            throw JuiceMakerError.outOfStock
        }
    }
    
    
    private func useFruit(for juice: Juice) throws {
        for (fruit, amount) in juice.recipe {
            try fruitStore.substractFruit(fruit: fruit, amount: amount)
        }
    }
    
    mutating func makeJuice(for selectedJuice: Juice) -> Result<Juice, Error> {
        do {
            for (fruit, amount) in recipe {
                try fruitStore.checkFruitStock(fruit: fruit, amount: amount)
                fruitStore.updateFruitStock(fruit: fruit, amount: amount)
            }
            return .success(selectedJuice)
        } catch {
            return .failure(error)
        }
    }
}
