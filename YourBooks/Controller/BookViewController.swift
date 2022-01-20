//
//  BookViewController.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import UIKit

class BookViewController : UIViewController {

    let bookIMG = UIImageView()
    
    let bookTitle = UILabel()
    let bookAuthor = UILabel()
    
    let bookRelased = BookContainerLabel()
    let endRead = BookContainerLabel(text: "31-01-22")
    let cosRead = BookContainerLabel(text: "chujoa ksiazka")
    
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        configureBookIMG()
        configureBookName()
        configureBookAuthor()
        configureStartLabel()
        configureEndLabel()
        configureCosLabel()
    }
    
    private func setupView() {
        view.setGradien(colorOne: .purple, colorTwo: .systemBlue)
    }
    
    private func configureBookIMG() {
        view.addSubview(bookIMG)
        bookIMG.translatesAutoresizingMaskIntoConstraints = false
        
        bookIMG.image = UIImage(named: "book")
        bookIMG.layer.cornerRadius = 5
        bookIMG.layer.cornerCurve = .continuous
        
        NSLayoutConstraint.activate([
            bookIMG.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            bookIMG.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bookIMG.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            bookIMG.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func configureBookName() {
        bookIMG.addSubview(bookTitle)
        bookTitle.translatesAutoresizingMaskIntoConstraints = false
        bookTitle.textAlignment = .center
        bookTitle.textColor = .white
        bookTitle.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            bookTitle.topAnchor.constraint(equalTo: bookIMG.topAnchor, constant: 10),
            bookTitle.centerXAnchor.constraint(equalTo: bookIMG.centerXAnchor),
            bookTitle.widthAnchor.constraint(equalTo: bookIMG.widthAnchor, multiplier: 0.9),
            bookTitle.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureBookAuthor() {
        bookIMG.addSubview(bookAuthor)
        bookAuthor.translatesAutoresizingMaskIntoConstraints = false
        bookAuthor.textAlignment = .center
        bookAuthor.textColor = .white
        bookAuthor.numberOfLines = 2
        
        
        NSLayoutConstraint.activate([
            bookAuthor.bottomAnchor.constraint(equalTo: bookIMG.bottomAnchor, constant: -10),
            bookAuthor.centerXAnchor.constraint(equalTo: bookIMG.centerXAnchor),
            bookAuthor.widthAnchor.constraint(equalTo: bookIMG.widthAnchor, multiplier: 0.9),
            bookAuthor.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureStartLabel() {
        view.addSubview(bookRelased)
        bookRelased.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            bookRelased.topAnchor.constraint(equalTo: bookIMG.bottomAnchor, constant: 20),
            bookRelased.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bookRelased.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            bookRelased.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureEndLabel() {
        view.addSubview(endRead)
        endRead.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            endRead.topAnchor.constraint(equalTo: bookRelased.bottomAnchor, constant: 20),
            endRead.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            endRead.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            endRead.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func configureCosLabel() {
        view.addSubview(cosRead)
        cosRead.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            cosRead.topAnchor.constraint(equalTo: endRead.bottomAnchor, constant: 20),
            cosRead.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cosRead.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            cosRead.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
