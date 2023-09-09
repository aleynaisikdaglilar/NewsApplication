//
//  SecondViewController.swift
//  NewsApp
//
//  Created by Aleyna Isikdaglilar [Tuzel Bankacilik Dijital Squad 1] on 11.11.2022.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DetailImageTableViewCell.self, forCellReuseIdentifier: DetailImageTableViewCell.identifier)
        tableView.register(DetailHeaderTableViewCell.self, forCellReuseIdentifier: DetailHeaderTableViewCell.identifier)
        tableView.register(DetailDescriptionTableViewCell.self, forCellReuseIdentifier: DetailDescriptionTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationItem.standardAppearance = appearance
        navigationItem.compactAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.largeTitleDisplayMode = .never
        //        navigatiobIteçm.rightbar = share butonu
        //        3 cell -image-header-descriptino
        
        view.backgroundColor = .systemRed
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        view.insetsLayoutMarginsFromSafeArea = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: DetailImageTableViewCell.identifier, for: indexPath) as! DetailImageTableViewCell
        } else if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: DetailHeaderTableViewCell.identifier, for: indexPath) as! DetailHeaderTableViewCell
        } else {
                cell = tableView.dequeueReusableCell(withIdentifier: DetailDescriptionTableViewCell.identifier, for: indexPath) as! DetailDescriptionTableViewCell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
