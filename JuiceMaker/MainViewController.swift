import UIKit

class MainViewController: UIViewController {
    private let fruitStore = FruitStore()
    
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
        button.setTitle("재고 수정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.addTarget(self, action: #selector(didTapmodifyOfStockButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapmodifyOfStockButton() {
        navigationController?.pushViewController(ModifyOfStockViewController(), animated: true)
    }
    
    private let strawberryEmoji = {
        let label = UILabel()
        label.text = "🍓"
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    private let bananaEmoji = {
        let label = UILabel()
        label.text = "🍌"
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    private let kiwiEmoji = {
        let label = UILabel()
        label.text = "🥝"
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    private let pineappleEmoji = {
        let label = UILabel()
        label.text = "🍍"
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    private let mangoEmoji = {
        let label = UILabel()
        label.text = "🥭"
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    private lazy var emojiStackView = {
        let stackView = UIStackView(arrangedSubviews: [strawberryEmoji, bananaEmoji, kiwiEmoji, pineappleEmoji, mangoEmoji])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 100
        return stackView
    }()
    
    private lazy var strawberryStockLabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray6
        label.text = fruitStore.printStrawberry()
        return label
    }()
    
    private lazy var bananaStockLabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray6
        label.text = fruitStore.printBanana()
        return label
    }()
    
    private lazy var kiwiStockLabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray6
        label.text = fruitStore.printKiwi()
        return label
    }()
    
    private lazy var pineappleStockLabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray6
        label.text = fruitStore.printPineapple()
        return label
    }()
    
    private lazy var mangoStockLabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray6
        label.text = fruitStore.printMango()
        return label
    }()
    
    private lazy var stockLabelStackView = {
        let stackView = UIStackView(arrangedSubviews: [strawberryStockLabel,bananaStockLabel,kiwiStockLabel,pineappleStockLabel,mangoStockLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 100
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
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            
            modifyOfStockButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            modifyOfStockButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            emojiStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            emojiStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stockLabelStackView.topAnchor.constraint(equalTo: emojiStackView.bottomAnchor, constant: 20),
            stockLabelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}

