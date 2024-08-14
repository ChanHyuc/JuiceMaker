import UIKit

class ModifyOfStockViewController: UIViewController {
    
    private static let fruitStore = FruitStore()
    
    private let titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray5
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "재고 추가"
        return label
    }()
    
    private func navigationItems() {
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(didTapNavigationRightButton))
    }
    
    @objc private func didTapNavigationRightButton() {
        navigationController?.popViewController(animated: true)
    }
    
    private let strawberryEmoji = createFruitEmoji("🍓")
    private let bananaEmoji = createFruitEmoji("🍌")
    private let kiwiEmoji = createFruitEmoji("🥝")
    private let pineappleEmoji = createFruitEmoji("🍍")
    private let mangoEmoji = createFruitEmoji("🥭")
    
    private static func createFruitEmoji(_ emoji: String) -> UILabel {
        let label = UILabel()
        label.text = emoji
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }
    
    private lazy var emojiStackView = {
        let stackView = UIStackView(arrangedSubviews: [strawberryEmoji, bananaEmoji, pineappleEmoji, kiwiEmoji, mangoEmoji])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let strawberryStockLabel = createStockLabel(stock: fruitStore.printStrawberry())
    private let bananaStockLabel = createStockLabel(stock: fruitStore.printBanana())
    private let pineappleStockLabel = createStockLabel(stock: fruitStore.printPineapple())
    private let kiwiStockLabel = createStockLabel(stock: fruitStore.printKiwi())
    private let mangoStockLabel = createStockLabel(stock: fruitStore.printMango())
    
    private static func createStockLabel(stock: String) -> UILabel {
        let label = UILabel()
        label.backgroundColor = .systemGray6
        label.text = stock
        label.textAlignment = .center
        return label
    }
    private lazy var stockLabelStackView = {
        let stackView = UIStackView(arrangedSubviews: [strawberryStockLabel, bananaStockLabel, pineappleStockLabel, kiwiStockLabel, mangoStockLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let strawberryStepper = createStepper()
    private let bananaStepper = createStepper()
    private let pineaplleStepper = createStepper()
    private let kiwiStepper = createStepper()
    private let mangoStepper = createStepper()
    
    private lazy var stepperStackView = {
        let stackView = UIStackView(arrangedSubviews: [strawberryStepper, bananaStepper, pineaplleStepper, kiwiStepper, mangoStepper])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private static func createStepper() -> UIStepper {
        let stepper = UIStepper()
        return stepper
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        navigationItems()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(emojiStackView)
        view.addSubview(stockLabelStackView)
        view.addSubview(stepperStackView)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            
            emojiStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            emojiStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emojiStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            stockLabelStackView.topAnchor.constraint(equalTo: emojiStackView.bottomAnchor, constant: 20),
            stockLabelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stockLabelStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            stockLabelStackView.heightAnchor.constraint(equalToConstant: 40),
            
            stepperStackView.topAnchor.constraint(equalTo: stockLabelStackView.bottomAnchor, constant: 20),
            stepperStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepperStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            stepperStackView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

}
