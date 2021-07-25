//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Manjusha Chembra on 24/07/21.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var viewModel = NewsListViewModel()
    
    lazy var headerView: NewsHeaderView = {
        let v = NewsHeaderView(fontSize: 32)
        return v
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.tableFooterView = UIView()
        table.register(NewsTableViewCell.self, forCellReuseIdentifier: viewModel.reuseID)
        table.delegate = self
        table.dataSource = self
        table.refreshControl = UIRefreshControl()
        table.refreshControl?.addTarget(self, action: #selector(pullToRefreshAction), for: .valueChanged)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        fetchNews()
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(headerView)
        view.addSubview(tableView)
        
        setupConstraints()
        
    }
    @objc private func pullToRefreshAction() {
        //refetch data
        self.fetchNews()
    }
    
    func setupConstraints() {
        //header
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
        //tableview
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    func fetchNews() {
        viewModel.getNews { (error) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.newsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseID, for: indexPath) as? NewsTableViewCell
        let news = viewModel.newsViewModel[indexPath.row]
        cell?.newsVM = news
        return cell ?? UITableViewCell()
    }

}

