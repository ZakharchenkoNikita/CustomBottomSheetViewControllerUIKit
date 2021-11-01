//
//  ViewController.swift
//  CustomBottomSheetViewControllerUIKit
//
//  Created by Nikita on 01.11.21.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tim Cook"
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()

    lazy var descriptionTextView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.font = .systemFont(ofSize: 16)
        textView.isEditable = false
        textView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sem fringilla ut morbi tincidunt augue interdum. Ut morbi tincidunt augue interdum velit euismod in pellentesque massa. Pulvinar etiam non quam lacus suspendisse faucibus interdum posuere. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci a. Eget nullam non nisi est sit amet. Odio pellentesque diam volutpat commodo. Id eu nisl nunc mi ipsum faucibus vitae. "
        return textView
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton()
        button.setTitle("More info", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .tintColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(presentModalController), for: .touchUpInside)
        return button
    }()
    
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionTextView, infoButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }

    private func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupConstraints() {
        view.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            containerStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
            containerStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            containerStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            infoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func presentModalController() {
        let modalVC = ModalViewController()
        modalVC.modalPresentationStyle = .overCurrentContext
        
        present(modalVC, animated: false)
    }
}

