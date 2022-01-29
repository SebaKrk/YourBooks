//
//  NewBookViewController.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import UIKit

class NewBookViewController : UIViewController {
    
    var stackView = UIStackView()
    let backgroundImge = UIImageView()
    
    private let titleLabel = CostumeTitleLabel()
    private let bookTitle = CostumeTexField(placeholder: "book title")
    private let bookAuthor = CostumeTexField(placeholder: "book author")
    private let bookReleased = CostumeTexField(placeholder: "book released")
    
    private let bookScore = StarRating()
    private let bookIMG = UIImageView()
    private let addBookButton = AddNewBookButton()

    private var viewModel = ValidModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        setupView()
        setupTextFieldObservers()
        
    }
    private func setupView() {
        view.backgroundColor = .black
        configureBackgraoundImg()
        configureStackView()
        configureTitleLabel()
        configureButton()
        configureNavigationController()
        view.addDismissKeyboardOnTapGesture()
    }
    private func configureNavigationController() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(handleBackButton))
    }
    
    
    //    MARK: - StackView
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [bookTitle,bookAuthor,bookReleased,bookScore,addBookButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        bookReleased.keyboardType = .numbersAndPunctuation
    }
    
    //    MARK: - SAVE
    
    @objc func handleAddBookButton() {
        guard let title = bookTitle.text else { return }
        guard let author = bookAuthor.text else { return}
        guard let released = bookReleased.text else { return }
        
        let favorite = BookModel(title: title, author: author, relased: released)
        DataManager.uppdateWith(favorite: favorite, actionType: .add) { error in
            guard let error = error else {
                self.presentAlertVC(title: "Succes", message: Messages.successfullyAdded.rawValue)
                return
            }
            self.presentAlertVC(title: "Upsss", message: error.rawValue)
        }
    }
    
    @objc func handleBackButton() {
        
        navigationController?.popViewController(animated: true)
    }
    
    //    MARK: Buttons Target
    
    private func configureButton() {
        addBookButton.addTarget(self, action: #selector(handleAddBookButton), for: .touchUpInside)
    }
    
    //    MARK: - Constraints
    
    private func configureBackgraoundImg() {
        view.addSubview(backgroundImge)
        backgroundImge.translatesAutoresizingMaskIntoConstraints = false
        backgroundImge.contentMode = .scaleAspectFit
        backgroundImge.image = UIImage(named: "Background2")
        
        NSLayoutConstraint.activate([
            backgroundImge.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImge.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
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
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Add New Book"
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            titleLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20)
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
            addBookButton.isEnabled = true
            addBookButton.backgroundColor = .purple
        } else {
            addBookButton.isEnabled = false
            addBookButton.backgroundColor = .systemPurple
        }
    }
    
    func setupTextFieldObservers() {
        bookTitle.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        bookAuthor.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        bookReleased.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}
