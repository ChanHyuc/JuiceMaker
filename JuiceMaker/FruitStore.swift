class FruitStore {
    static let shared = FruitStore()
    
    private var fruitStock: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func printFruit(_ fruit: Fruit) -> String {
        guard let stock = fruitStock[fruit] else {
            return "N/A"
        }
        return String(stock)
    }
    
    func addStock(_ fruit: Fruit.RawValue) {
        guard let currentStock = Fruit(rawValue: fruit), let modifyStock = fruitStock[currentStock] else {
            return
        }
        fruitStock[currentStock] = modifyStock + 1
    }
        
    func subtractStock(_ fruit: Fruit.RawValue) {
        guard let currentStock = Fruit(rawValue: fruit), let modifyStock = fruitStock[currentStock] else {
            return
        }
        fruitStock[currentStock] = modifyStock - 1
    }
    
    func useFruit(for juice: Juice) throws {
        switch juice {
        case .strawberryJuice:
            guard let currentStock = fruitStock[.strawberry], currentStock - 6 >= 0 else {
                throw JuiceMakerError.outOfStock
            }
            fruitStock[.strawberry] = currentStock - 6
            
        case .bananaJuice:
            guard let currentStock = fruitStock[.banana], currentStock - 2 >= 0 else {
                throw JuiceMakerError.outOfStock
            }
            fruitStock[.banana] = currentStock - 2
            
        case .kiwiJuice:
            guard let currentStock = fruitStock[.kiwi], currentStock - 4 >= 0 else {
                throw JuiceMakerError.outOfStock
            }
            fruitStock[.kiwi] = currentStock - 4
            
        case .pineappleJuice:
            guard let currentStock = fruitStock[.pineapple], currentStock - 3 >= 0 else {
                throw JuiceMakerError.outOfStock
            }
            fruitStock[.pineapple] = currentStock - 3
            
        case .mangoJuice:
            guard let currentStock = fruitStock[.mango], currentStock - 5 >= 0 else {
                throw JuiceMakerError.outOfStock
            }
            fruitStock[.mango] = currentStock - 5
            
        case .strawberryBananaJuice:
            guard let strawberryStock = fruitStock[.strawberry],
                  let bananaStock = fruitStock[.banana],
                  strawberryStock - 5 >= 0, bananaStock - 5 >= 0  else {
                throw JuiceMakerError.outOfStock
            }
            fruitStock[.strawberry] = strawberryStock - 5
            fruitStock[.banana] = bananaStock - 5
            
        case .mangoKiwiJuice:
            guard let mangoStock = fruitStock[.mango],
                  let kiwiStock = fruitStock[.kiwi],
                  mangoStock - 5 >= 0, kiwiStock - 5 >= 0  else {
                throw JuiceMakerError.outOfStock
            }
            fruitStock[.mango] = mangoStock - 5
            fruitStock[.kiwi] = kiwiStock - 5
        }
    }
}
