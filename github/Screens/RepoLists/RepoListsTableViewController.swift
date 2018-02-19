//
//  RepoListsTableViewController.swift
//  github
//
//  Created by Abdullah Tawfik on 19/02/2018.
//  Copyright © 2018 Abdullah Tawfik. All rights reserved.
//

import UIKit
import Alamofire

class RepoListsTableViewController: UITableViewController {
    
    var repos: [Repo] = []
    private var getRepoData = GetRepo()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        
        setup()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier, for: indexPath) as! RepoTableViewCell

        let repo = repos[indexPath.row]
        
        cell.idLabel.text = "\(repo.id)"
        cell.repoNameLabel.text = repo.name
        cell.authorLabel.text = repo.author
        cell.descriptionLabel.text = repo.description

        return cell
    }
}

// MARK: - Setup 🔨
private extension RepoListsTableViewController {
    func setup() {
        tableViewInit()
        getReposData()
    }
    
    func tableViewInit() {
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.register(RepoTableViewCell.nib, forCellReuseIdentifier: RepoTableViewCell.identifier)
    }
    
    @objc func getReposData() {
        getRepoData.getRepo(url: GetRepo.basicURL) { (repo) in
            self.repos = repo
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            }
        }
    }
    
    func regreshControl() {
        let control = UIRefreshControl()
        tableView.refreshControl = control
        control.addTarget(self, action: #selector(getReposData), for: .valueChanged)
    }
}
