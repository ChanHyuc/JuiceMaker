import UIKit

class MainViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(titleLabel)
        view.addSubview(modifyOfStockButton)
        view.addSubview(emojiStackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            modifyOfStockButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            modifyOfStockButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            emojiStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            emojiStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

}

