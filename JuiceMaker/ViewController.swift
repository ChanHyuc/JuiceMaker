import UIKit

class ViewController: UIViewController {
    
    private let strawberryEmoji = {
        let label = UILabel()
        label.text = "🍓"
        return label
    }()
    
    private let bananaEmoji = {
        let label = UILabel()
        label.text = "🍌"
        return label
    }()
    
    private let kiwiEmoji = {
        let label = UILabel()
        label.text = "🥝"
        return label
    }()
    
    private let pineappleEmoji = {
        let label = UILabel()
        label.text = "🍍"
        return label
    }()
    
    private let mangoEmoji = {
        let label = UILabel()
        label.text = "🥭"
        return label
    }()
    
    private lazy var emojiStackView = {
        let stackView = UIStackView(arrangedSubviews: [strawberryEmoji, bananaEmoji, kiwiEmoji, pineappleEmoji, mangoEmoji])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(emojiStackView)
        
        NSLayoutConstraint.activate([
            emojiStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emojiStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

