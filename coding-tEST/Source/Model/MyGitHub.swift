//
//  MyGitHub.swift
//  coding-tEST
//
//  Created by Henry Chukwu on 1/20/20.
//  Copyright © 2020 Henry Chukwu. All rights reserved.
//

import UIKit
import Apollo

struct CommitsByAuthor {
    var username: String
    var commitNumber: String
    var commitMessage: String
}

class MyGitHub {
    
    static let shared = MyGitHub()
    
    let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(bearerToken)"]
        
        let url = URL(string: graphQLURL)!
        
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, session: URLSession(configuration: configuration)))
    }()
    
    var commitByAuthor = [CommitsByAuthor]()
    
    func getGithubUser() {
        
        let getUserQL = GetUserQlQuery()
        apollo.fetch(query: getUserQL) { result in
            print(result)
            
            switch result {
            case .success(let graphQLResult):
                print("username: \(graphQLResult.data?.user)")
//                print("email: \(graphQLResult.data?.user?.email ?? "no email")")
            case .failure(let error):
                print("error]]=-\(error.localizedDescription)")
            }
            
        }
    }
    
    func getLatestCommits(completion: @escaping ([CommitsByAuthor]) -> ()) {
        apollo.fetch(query: GetLatestCommitsQuery()) { result in
            
            switch result {
            case .success(let graphQLResult):
                self.commitByAuthor = []
                if let newCommits = graphQLResult.data?.repository?.ref?.target.asCommit?.history.edges {
                    for cm in newCommits {
                        let authorCommit = cm.flatMap { commit in
                            self.createAlerts(commit: commit)
                        }
                        self.commitByAuthor.append(authorCommit!)
                    }
                    completion(self.commitByAuthor)
                }
            case .failure(let error):
                print(error)
                completion(self.commitByAuthor)
            }
        }
    }
    
    func createAlerts(commit: GetLatestCommitsQuery.Data.Repository.Ref.Target.AsCommit.History.Edge) -> CommitsByAuthor? {
        return CommitsByAuthor(username: commit.node?.author?.name ?? "N/A", commitNumber: commit.node!.oid, commitMessage: commit.node!.message)
    }
}
