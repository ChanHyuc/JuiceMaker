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
    
    func updateFruitStock(fruit: Fruit, amount: Int) {
        if let currentStock = fruitStock[fruit] {
            fruitStock[fruit] = currentStock - amount
        }
    }
    
}
