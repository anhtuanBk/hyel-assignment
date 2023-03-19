//
//  repository.swift
//  repository
//
//

public class Repository {
    public static let shared = Repository()
    
    private let baseUrl: BaseUrl
    init() {
        self.baseUrl = BaseUrl(apiEndpointUrl: RepositoryConfigs.shared.apiEndpointUrl)
    }
}
