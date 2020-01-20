//
//  MyGitHub.swift
//  coding-tEST
//
//  Created by Henry Chukwu on 1/20/20.
//  Copyright © 2020 Henry Chukwu. All rights reserved.
//

import UIKit
import Apollo

class MyGitHub {
    
    static let shared = MyGitHub()
    
    let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(bearerToken)"]
        
        let url = URL(string: graphQLURL)!
        
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, session: URLSession(configuration: configuration)))
    }()
    
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
    
//    func getLatestCommits() {
//        apollo.fetch(query: <#T##GraphQLQuery#>)
//    }
}
