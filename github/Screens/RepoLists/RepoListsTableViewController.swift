//
//  RepoListsTableViewController.swift
//  github
//
//  Created by Abdullah Tawfik on 19/02/2018.
//  Copyright © 2018 Abdullah Tawfik. All rights reserved.
//

import UIKit

class RepoListsTableViewController: UITableViewController {
    
    var repos: [Repo] = []

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
    }
    
    func tableViewInit() {
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.register(RepoTableViewCell.nib, forCellReuseIdentifier: RepoTableViewCell.identifier)
    }
  
}
