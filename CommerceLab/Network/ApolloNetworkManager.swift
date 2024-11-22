//
//  ApolloNetworkManager.swift
//  CommerceLab
//
//  Created by Amir Daliri on 22.11.2024.
//

import Apollo
import Foundation

class ApolloNetworkManager {
    static let shared = ApolloNetworkManager()
    
    private(set) lazy var apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "language": "tr",
            "culture": "tr-TR",
            "Content-Type": "application/json"
        ]
        let apolloStore = ApolloStore()
        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: DefaultInterceptorProvider(client: URLSessionClient(), shouldInvalidateClientOnDeinit: true, store: apolloStore),
            endpointURL: URL(string: "https://hcapi.sch.awstest.hebiar.com/graphql")!,
            additionalHeaders: configuration.httpAdditionalHeaders as! [String: String]
        )
        
        return ApolloClient(networkTransport: networkTransport, store: apolloStore)
    }()
}
