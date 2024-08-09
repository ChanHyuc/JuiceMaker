import UIKit

class ModifyOfStockViewController: UIViewController {
    
    private let fruitStore = FruitStore()
    
    private let titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray5
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "재고 추가"
        return label
    }()
    
    private let strawberryEmoji = {
        let label = UILabel()
        label.text = "🍓"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    private let bananaEmoji = {
        let label = UILabel()
        label.text = "🍌"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    private let kiwiEmoji = {
        let label = UILabel()
        label.text = "🥝"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    private let pineappleEmoji = {
        let label = UILabel()
        label.text = "🍍"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    private let mangoEmoji = {
        let label = UILabel()
        label.text = "🥭"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    private lazy var emojiStackView = {
        let stackView = UIStackView(arrangedSubviews: [strawberryEmoji, bananaEmoji, pineappleEmoji, kiwiEmoji, mangoEmoji])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var strawberryStockLabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray6
        label.text = fruitStore.printStrawberry()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var bananaStockLabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray6
        label.text = fruitStore.printBanana()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var pineappleStockLabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray6
        label.text = fruitStore.printPineapple()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var kiwiStockLabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray6
        label.text = fruitStore.printKiwi()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var mangoStockLabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray6
        label.text = fruitStore.printMango()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var stockLabelStackView = {
        let stackView = UIStackView(arrangedSubviews: [strawberryStockLabel, bananaStockLabel, pineappleStockLabel, kiwiStockLabel, mangoStockLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func navigationItems() {
        
    }
    
    private func configureUI() {
        navigationItem.hidesBackButton = true
        
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(emojiStackView)
        view.addSubview(stockLabelStackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            
            emojiStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            emojiStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emojiStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            stockLabelStackView.topAnchor.constraint(equalTo: emojiStackView.bottomAnchor, constant: 20),
            stockLabelStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stockLabelStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            stockLabelStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
