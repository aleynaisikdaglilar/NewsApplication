//
//  ViewController.swift
//  NewsApp
//
//  Created by Aleyna Isikdaglilar [Tuzel Bankacilik Dijital Squad 1] on 25.10.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var articleListViewModel: ArticleListViewModel!
    private var articleViewModel: ArticleViewModel!
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NEWS"
        navigationItem.backButtonTitle = "back"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        
        let webService = WebService()
        
        webService.downloadNews { articles in
            print("Articles 0 author : \(articles[0].author)")
            print("Articles 0 title : \(articles[0].title)")
            self.articleListViewModel = ArticleListViewModel(articleList: articles )
            self.tableView.reloadData()
            print("Articles : \(articles)")
        } failure: { error in
            if let error = error {
                print("Error : \(error.localizedDescription)")
            }
        }
        
        tableView.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListViewModel == nil ? 0 : articleListViewModel.numberOfRowsInSection()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
        let articleViewModel = articleListViewModel.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleViewModel.title
        cell.descriptionTitleLabel.text = articleViewModel.description
        cell.dateLabel.text = String(articleViewModel.publishedAt.dropLast(10))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = SecondViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

