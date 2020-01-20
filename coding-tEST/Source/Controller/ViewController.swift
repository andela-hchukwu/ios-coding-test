//
//  ViewController.swift
//  coding-tEST
//
//  Created by Henry Chukwu on 1/20/20.
//  Copyright © 2020 Henry Chukwu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var commits = [CommitsByAuthor]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        MyGitHub.shared.getGithubUser()
        MyGitHub.shared.getLatestCommits { commits in
            self.commits = commits
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commitCell") as? CommitCell else { return UITableViewCell() }
        
        let commit = commits[indexPath.row]
        cell.userNameLabel.text = commit.username
        cell.commitNumberLabel.text = commit.commitNumber
        cell.commitMessageLabel.text = commit.commitMessage
        
        return cell
    }
    
    
}

