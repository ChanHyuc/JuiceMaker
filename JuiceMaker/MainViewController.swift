import UIKit

class MainViewController: UIViewController {
    private let fruitStore = FruitStore()
    private var juice: Juice?
    
    private let titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray5
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "맛있는 쥬스를 만들어 드려요!"
        return label
    }()
    
    private let modifyOfStockButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("재고\n수정", for: .normal)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.addTarget(self, action: #selector(didTapmodifyOfStockButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapmodifyOfStockButton() {
        navigationController?.pushViewController(ModifyOfStockViewController(), animated: true)
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
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var strawberryStockLabel = createStockLabel(stock: fruitStore.printFruit("strawberry"))
    private lazy var bananaStockLabel = createStockLabel(stock: fruitStore.printFruit("banana"))
    private lazy var pineappleStockLabel = createStockLabel(stock: fruitStore.printFruit("pineapple"))
    private lazy var kiwiStockLabel = createStockLabel(stock: fruitStore.printFruit("kiwi"))
    private lazy var mangoStockLabel = createStockLabel(stock: fruitStore.printFruit("mango"))
    
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
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var strawberryBananaJuiceOrderButton = createJuiceOrderButton(juiceName: "\(Juice.strawberryBananaJuice.rawValue) 주문")
    private lazy var mangoKiwiJuiceJuiceOrderButton = createJuiceOrderButton(juiceName: "\(Juice.mangoKiwiJuice.rawValue) 주문")
    private lazy var strawberryJuiceOrderButton = createJuiceOrderButton(juiceName: "\(Juice.strawberryJuice.rawValue) 주문")
    private lazy var bananaOrderButton = createJuiceOrderButton(juiceName: "\(Juice.bananaJuice.rawValue) 주문")
    private lazy var pineappleJuiceOrderButton = createJuiceOrderButton(juiceName: "\(Juice.pineappleJuice.rawValue) 주문")
    private lazy var kiwiJuiceOrderButton = createJuiceOrderButton(juiceName: "\(Juice.kiwiJuice.rawValue) 주문")
    private lazy var mangoJuiceOrderButton = createJuiceOrderButton(juiceName: "\(Juice.mangoJuice.rawValue) 주문")
    
    private func createJuiceOrderButton(juiceName: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(juiceName, for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .systemBackground
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.addAction(UIAction { [weak self] _ in
            self?.didTapCreateJuiceOrderButton(fruitName: juiceName)
        }, for: .touchUpInside)
        
        return button
    }
    
    @objc private func didTapCreateJuiceOrderButton(fruitName: String) {
        let cleanedFruitName = fruitName.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "주문", with: "").trimmingCharacters(in: .whitespaces)
        do {
            try fruitStore.useFruit(for: cleanedFruitName)
            
            strawberryStockLabel.text = fruitStore.printFruit("strawberry")
            bananaStockLabel.text = fruitStore.printFruit("banana")
            pineappleStockLabel.text = fruitStore.printFruit("pineapple")
            kiwiStockLabel.text = fruitStore.printFruit("kiwi")
            mangoStockLabel.text = fruitStore.printFruit("mango")
            
            let successAlert = UIAlertController(title: "\(cleanedFruitName) 나왔습니다! 맛있게 드세요!", message: "", preferredStyle: .alert)
            successAlert.addAction(UIAlertAction(title: "확인", style: .default , handler: { _  in }) )
            self.present(successAlert, animated: true)
        } catch {
            let failedAlert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: "", preferredStyle: .alert)
            failedAlert.addAction(UIAlertAction(title: "확인", style: .default , handler: { _  in self.didTapmodifyOfStockButton() } ) )
            failedAlert.addAction(UIAlertAction(title: "취소", style: .cancel , handler: { _  in }) )
            self.present(failedAlert, animated: true)
        }
        
    }
    
    private lazy var orderButtonStackView = {
        let topStackView = UIStackView(arrangedSubviews: [strawberryBananaJuiceOrderButton, mangoKiwiJuiceJuiceOrderButton])
        topStackView.axis = .horizontal
        topStackView.distribution = .fillEqually
        topStackView.spacing = 10
        
        let bottomStackView = UIStackView(arrangedSubviews: [strawberryJuiceOrderButton, bananaOrderButton, pineappleJuiceOrderButton, kiwiJuiceOrderButton, mangoJuiceOrderButton])
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillEqually
        bottomStackView.spacing = 10
        
        let stackView = UIStackView(arrangedSubviews: [topStackView, bottomStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(titleLabel)
        view.addSubview(modifyOfStockButton)
        view.addSubview(emojiStackView)
        view.addSubview(stockLabelStackView)
        view.addSubview(orderButtonStackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            
            modifyOfStockButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            modifyOfStockButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            emojiStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            emojiStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emojiStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            stockLabelStackView.topAnchor.constraint(equalTo: emojiStackView.bottomAnchor, constant: 20),
            stockLabelStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stockLabelStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            stockLabelStackView.heightAnchor.constraint(equalToConstant: 40),
            
            orderButtonStackView.topAnchor.constraint(equalTo: stockLabelStackView.bottomAnchor, constant: 20),
            orderButtonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orderButtonStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9)
        ])
    }

}

