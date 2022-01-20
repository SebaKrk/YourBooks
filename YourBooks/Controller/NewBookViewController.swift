//
//  NewBookViewController.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import UIKit

class NewBookViewController : UIViewController {
    
    var stackView = UIStackView()
    
    private let bookTitle = CostumeTexField(placeholder: "book title")
    private let bookAuthor = CostumeTexField(placeholder: "book author")
    private let bookReleased = CostumeTexField(placeholder: "book released")
    
    private let bookScore = UITextField()
    private let bookIMG = UIImageView()
    
    private let doneButton = DoneButton()
    private let backButton = BackButton()
    
    private var viewModel = ValidModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        setupView()
        setupTextFieldObservers()
        
    }
    private func setupView() {
        view.setGradien(colorOne: .purple, colorTwo: .systemBlue)
        configureStackView()
        configureButton()
        configureBackButton()
    }
    //    MARK: - StackView
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [bookTitle,bookAuthor,bookReleased,doneButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
    }
    //    MARK: - SAVE
    
    @objc func handleDoneButton() {
        guard let title = bookTitle.text else { return }
        guard let author = bookAuthor.text else { return}
        guard let released = bookReleased.text else { return }
        
        let favorite = BookModel(title: title, author: author, relased: released)
        DataManager.uppdateWith(favorite: favorite, actionType: .add) { error in
            guard let error = error else {
                self.presentAlertOnMainThred(title: "Succes", message: Messages.successfullyAdded.rawValue)
                return
            }
            print("error \(error)")
        }
    }
    
    @objc func handleBackButton() {
        dismiss(animated: true, completion: nil)
    }
    
    //    MARK: Buttons Target
    
    private func configureButton() {
        doneButton.addTarget(self, action: #selector(handleDoneButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
    }
    
    //    MARK: - Constraints
    
    private func configureStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 250),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
    }
    private func configureBackButton() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    //    MARK: - TextFieldObservers
    
    @objc func textDidChange(sender: UITextField) {
        if sender == bookTitle {
            viewModel.title = sender.text
        } else if sender == bookAuthor {
            viewModel.author = sender.text
        } else {
            viewModel.released = sender.text
        }
        checkFormStatus()
    }
    
    func checkFormStatus() {
        if viewModel.formIsValid {
            doneButton.isEnabled = true
            doneButton.backgroundColor = .purple
        } else {
            doneButton.isEnabled = false
            doneButton.backgroundColor = .systemPurple
        }
    }
    
    func setupTextFieldObservers() {
        bookTitle.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        bookAuthor.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        bookReleased.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}
