import UIKit

class ModifyOfStockViewController: UIViewController {
    private let fruitStore = FruitStore.shared
    
    private let titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray5
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "재고 추가"
        return label
    }()
    
    private let closeButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("닫기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapCloseButton() {
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
    
    private lazy var strawberryStockLabel = createStockLabel(stock: fruitStore.printFruit(.strawberry))
    private lazy var bananaStockLabel = createStockLabel(stock: fruitStore.printFruit(.banana))
    private lazy var pineappleStockLabel = createStockLabel(stock: fruitStore.printFruit(.pineapple))
    private lazy var kiwiStockLabel = createStockLabel(stock: fruitStore.printFruit(.kiwi))
    private lazy var mangoStockLabel = createStockLabel(stock: fruitStore.printFruit(.mango))
    
    private func createStockLabel(stock: String) -> UILabel {
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
    
    private lazy var strawberryStepper = createStepper(for: "strawberry")
    private lazy var bananaStepper = createStepper(for: "banana")
    private lazy var pineappleStepper = createStepper(for: "pineapple")
    private lazy var kiwiStepper = createStepper(for: "kiwi")
    private lazy var mangoStepper = createStepper(for: "mango")
    
    private lazy var stepperStackView = {
        let stackView = UIStackView(arrangedSubviews: [strawberryStepper, bananaStepper, pineappleStepper, kiwiStepper, mangoStepper])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private func createStepper(for fruit: String) -> UIStepper {
        let stepper = UIStepper()
        stepper.accessibilityIdentifier = fruit
        stepper.minimumValue = -1
        stepper.addTarget(self, action: #selector(didTapStepper), for: .valueChanged)
        return stepper
    }
    
    @objc private func didTapStepper(_ sender: UIStepper) {
        guard let fruit = sender.accessibilityIdentifier else { return }
        let stepperValue = sender.value
        
        stepperValue > 0 ? fruitStore.plusOfStock(fruit) : fruitStore.minusOfStock(fruit)
        sender.value = 0
        
        strawberryStockLabel.text = fruitStore.printFruit(.strawberry)
        bananaStockLabel.text = fruitStore.printFruit(.banana)
        pineappleStockLabel.text = fruitStore.printFruit(.pineapple)
        kiwiStockLabel.text = fruitStore.printFruit(.kiwi)
        mangoStockLabel.text = fruitStore.printFruit(.mango)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(emojiStackView)
        view.addSubview(stockLabelStackView)
        view.addSubview(stepperStackView)
        view.addSubview(closeButton)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            
            closeButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: emojiStackView.trailingAnchor),
            
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
        ])
    }

}
