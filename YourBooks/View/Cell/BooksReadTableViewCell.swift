//
//  BooksReadTableViewCell.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import UIKit

class BooksReadTableViewCell : UITableViewCell {
    
    static let identifier = "BooksReadTableViewCell"
    
    let container = UIView()
    let nameBookLabel = BookNameLabel()
    let authorBookLabel = BookAuthorLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        configureContainer()
        configureNameBookLabel()
        configureAuthorBookLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(bookData : BookModel) {
        nameBookLabel.text = bookData.title
        authorBookLabel.text = bookData.author
    }
    private func configureContainer() {
        contentView.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.backgroundColor = UIColor(displayP3Red: 37, green: 37, blue: 37, alpha: 0.3)
        container.layer.cornerRadius = 15
        container.layer.borderWidth  = 0.5
        container.layer.borderColor = UIColor.lightGray.cgColor
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10)
        ])
    }
    
    
    private func configureNameBookLabel() {
        container.addSubview(nameBookLabel)
        nameBookLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameBookLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            nameBookLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 20),
            nameBookLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            nameBookLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    private func configureAuthorBookLabel() {
        container.addSubview(authorBookLabel)
        authorBookLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            authorBookLabel.topAnchor.constraint(equalTo: nameBookLabel.bottomAnchor),
            authorBookLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 20),
            authorBookLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            authorBookLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor,constant: -10)
        ])
    }
}

