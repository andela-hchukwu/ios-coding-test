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
    @IBOutlet weak var errorLabel: UILabel!
    
    var commits = [CommitsByAuthor]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        MyGitHub.shared.getGithubUser()
        MyGitHub.shared.getLatestCommits { commits in
            if commits.count == 0 {
                self.tableView.isHidden = true
                self.errorLabel.isHidden = false
            } else {
                self.commits = commits
                self.errorLabel.isHidden = true
                self.tableView.reloadData()
            }
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

