//
//  AlertViewController.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import UIKit

class AlertViewController : UIViewController {
    
    let container = UIView()
    let titleLabel = UILabel()
    let messageLabel = UILabel()
    let dissmisButton = UIButton()
    

    init(title : String, message: String) {
        super.init(nibName: nil, bundle: nil)
        titleLabel.text = title
        messageLabel.text = message
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        container.layer.cornerRadius = 15
    }
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.7)
        configureContainer()
        configureTitleLabel()
        configureButton()
        configureMessageLabel()
    }
    
    @objc func handleDissmisButton() {
        dismiss(animated: true, completion: nil)
    }
    
    private func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.borderColor = UIColor.purple.cgColor
        container.layer.borderWidth = 5
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
    private func configureTitleLabel() {
        container.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Baskerville-Bold", size: 32)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor,constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func configureButton(){
        container.addSubview(dissmisButton)
        dissmisButton.translatesAutoresizingMaskIntoConstraints = false
        
        dissmisButton.setTitle("OK", for: .normal)
        dissmisButton.setTitleColor(.white, for: .normal)
        dissmisButton.backgroundColor = .black
        dissmisButton.layer.cornerRadius = 10
        dissmisButton.addTarget(self, action: #selector(handleDissmisButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            dissmisButton.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            dissmisButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
            dissmisButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            dissmisButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            dissmisButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func configureMessageLabel() {
        container.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.font = UIFont(name: "Baskerville", size: 24)
        messageLabel.textColor = .darkGray
        messageLabel.numberOfLines = 4
        messageLabel.textAlignment = .center
        
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -20),
            messageLabel.bottomAnchor.constraint(equalTo: dissmisButton.topAnchor,constant: -20)
        ])
    }
}

