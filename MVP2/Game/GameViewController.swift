//
//  ViewController.swift
//  MVP2
//
//  Created by Adlet Zhantassov on 30.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - Views
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start game", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 255, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        return button
    }()
    
    private lazy var text: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()
    
    //MARK: - DidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(button)
        view.addSubview(text)
    }
    
    private func setupConstraints() {
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
        }
        
        text.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
        }
    }
    
    //MARK: - Logic
    
    lazy var presenter = Presenter(with: self)
    
    @objc func startGame() {
        presenter.startGame()
    }
}

extension ViewController: PresenterView {
    
    func updateGame(_ model: GameViewData) {
        text.text = model.name
        self.view.backgroundColor = .yellow
    }
}

