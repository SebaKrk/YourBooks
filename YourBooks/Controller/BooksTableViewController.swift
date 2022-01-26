//
//  BooksTableViewController.swift
//  YourBooks
//
//  Created by Sebastian Sciuba on 20/01/2022.
//

import Foundation
import UIKit

enum Scope : Int {
    case def = 0, az, za
}

class BooksTableViewController : UIViewController {
    
    let backgroundImge = UIImageView()
    
    let searchController = UISearchController()
    let tableView = UITableView()
    
    var booksRead : [BookModel] = []
    var filteredBooks : [BookModel] = []
    var isSearching = false
    
    let plusButton = PlusButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
        setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getBookData()
        showSearchBar()
        checkIfFavListIsEmpty()
    }
    
    private func setupView() {
        view.backgroundColor = .black
        configureBackgraoundImg()
        configureTableView()
        configurePlusButton()
    }
    
    //    MARK: - NavigationBar
    
    private func setupNavigationBar() {
        title = "Books"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .systemPurple
    }
    
    //  MARK: - SearchBar
    
    @objc func showSearchBar() {
        
        searchController.searchBar.isHidden = false
        searchController.searchBar.delegate = self
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["DEF","A-Z","Z-A"]
        
        searchController.automaticallyShowsCancelButton = true
        searchController.automaticallyShowsScopeBar = true
        
        let searchField = searchController.searchBar.searchTextField
        searchField.textColor = UIColor.systemPurple
    }
    //    MARK: - TableView
    private func setupTableView() {
        tableView.register(BooksReadTableViewCell.self, forCellReuseIdentifier: BooksReadTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        tableView.backgroundColor = .clear
        tableView.reloadData()
    }
    //    MARK: - GetData
    
    private func getBookData() {
        DataManager.retrieveFavorites { result in
            switch result {
                
            case .success(let favorite):
                self.booksRead = favorite
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                self.presentAlertVC(title: "Upsss", message: error.rawValue)
            }
        }
    }
    
    //    MARK: OBJC Func
    
    @objc func handleAddButton() {
        let desVC = NewBookViewController()
        navigationController?.pushViewController(desVC, animated: true)
    }
    
    //    MARK: - Constraints
    
    private func configureBackgraoundImg() {
        view.addSubview(backgroundImge)
        backgroundImge.translatesAutoresizingMaskIntoConstraints = false
        backgroundImge.contentMode = .scaleAspectFill
        backgroundImge.image = UIImage(named: "Background")
        
        NSLayoutConstraint.activate([
            backgroundImge.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImge.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImge.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            backgroundImge.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ])
    }
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configurePlusButton() {
        view.addSubview(plusButton)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        
        plusButton.addTarget(self, action: #selector(handleAddButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            plusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -25),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            plusButton.heightAnchor.constraint(equalToConstant: 50),
            plusButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    //    MARK: - Helpers
    
    private func checkIfFavListIsEmpty() {
        DataManager.retrieveFavorites { result in
            switch result {
            case .success(let favorite):
                if favorite.isEmpty { self.presentAlertVC(title: "Upss", message: Messages.emptyList.rawValue) }
            case .failure: break
            }
        }
    }
}
// MARK: - UITableViewDataSource, UITableViewDelegate

extension BooksTableViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  isSearching ? filteredBooks.count : booksRead.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BooksReadTableViewCell.identifier) as! BooksReadTableViewCell
        let activeArray = isSearching ? filteredBooks[indexPath.row] : booksRead[indexPath.row]
        cell.setData(bookData: activeArray)
        cell.selectionStyle = .none
        
        return cell
    }
    //    MARK: - didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let desVC = BookViewController()
        let activeArray = isSearching ? filteredBooks[indexPath.row] : booksRead[indexPath.row]
        desVC.bookTitle.text = activeArray.title
        desVC.bookAuthor.text = activeArray.author
        desVC.bookRelased.label.text = activeArray.relased
        
        if let sheet = desVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(desVC, animated: true, completion: nil)
    }
    
    //    MARK: - trailingSwipeActionsConfigurationForRowAt
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Deleted
        let deletedItem = UIContextualAction(style: .destructive, title: nil) { (contextualAction, view, boolValue) in
            let favorite = self.booksRead[indexPath.row]
            self.booksRead.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            DataManager.uppdateWith(favorite: favorite, actionType: .remove) { error in
                guard let error = error else {return}
                self.presentAlertVC(title: "Upss", message: error.rawValue)
            }
            self.presentAlertVC(title: "Succes", message: Messages.successfullyRemove.rawValue)
        }
        deletedItem.image = UIImage(systemName: "xmark", withConfiguration:UIImage.SymbolConfiguration(weight: .light))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        deletedItem.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.1)
        
        // Share
        let shareItem = UIContextualAction(style: .normal, title: nil) { contextualAction, view, boolValue in
            self.presentAlertVC(title: "Upps", message: Messages.subscription.rawValue)
        }
        shareItem.image = UIImage(systemName: "arrow.up", withConfiguration:UIImage.SymbolConfiguration(weight: .light))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        shareItem.backgroundColor =  UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.1)
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deletedItem, shareItem])
        
        return swipeActions
    }
}

// MARK: - UISearchBarDelegate

extension BooksTableViewController : UISearchBarDelegate {
    
    //    MARK: - TextDidChange
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            tableView.reloadData()
        } else {
            isSearching = true
            filteredBooks = booksRead.filter{$0.title.contains(searchText)}
            tableView.reloadData()
        }
    }
    
    //    MARK: - CancelButtonClicked
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        tableView.reloadData()
    }
    
    //    MARK: - selectedScopeButtonIndexDidChange
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    
        let scope = Scope(rawValue: selectedScope)
        switch scope {
        case .def:
            isSearching = false
            filteredBooks = booksRead
            tableView.reloadData()
        case .az :
            isSearching = true
            filteredBooks = booksRead.sorted { $0.title < $1.title }
            tableView.reloadData()
        case .za :
            isSearching = true
            filteredBooks = booksRead.sorted { $0.title > $1.title }
            tableView.reloadData()
        
        case .none:
            print("none")
        case .some(_):
            print("some")
        }
    }
}
