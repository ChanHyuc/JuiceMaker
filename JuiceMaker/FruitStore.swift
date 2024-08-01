class FruitStore {
    private var fruits: (strawberry: Int, banana: Int, pineapple: Int, kiwi: Int, mango: Int) = (10, 10, 10, 10, 10)
    
    func useFruit(for juice: Juice) {
        switch juice {
        case .strawberryJuice:
            fruits.strawberry -= 16
        case .bananaJuice:
            fruits.banana -= 2
        case .kiwiJuice:
            fruits.kiwi -= 3
        case .pineappleJuice:
            fruits.pineapple -= 2
        case .mangoJuice:
            fruits.mango -= 3
        case .strawberryBananaJuice:
            fruits.strawberry -= 10
            fruits.banana -= 1
        case .mangoKiwiJuice:
            fruits.mango -= 2
            fruits.kiwi -= 1
        }
    }
    
}
