//
//  NetworkServiceTests.swift
//  GBShopTests
//
//  Created by Григорий Виняр on 05/07/2022.
//

import XCTest
@testable import GBShop

enum NetworkErrors {
    case networkError
    case dataError
    case serverError
}

class NetworkServiceTests: XCTestCase {

    var mockURLSession: MockURLSession!
    var sut: NetworkService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockURLSession = MockURLSession(data: nil, urlResponse: nil, responseError: nil)
        sut = NetworkService()
    }

    override func tearDownWithError() throws {
        
        mockURLSession = nil
        sut = nil
        try super.tearDownWithError()
    }

    func userLogin() {
        let urlString = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/login.json"
        let completionHandler = {(result: Bool) in }
        sut.logIn(urlString: urlString, name: "login", password: "password", result: completionHandler)
        mockURLSession.url = URL(string: urlString)
    }
    
    func testLoginUsesCorrectHost() {
        userLogin()
        XCTAssertEqual(mockURLSession.urlComponents?.host, "raw.githubusercontent.com")
    }
    
    func testLoginUsesCorrectPath() {
        userLogin()
        XCTAssertEqual(mockURLSession.urlComponents?.path, "/GeekBrainsTutorial/online-store-api/master/responses/login.json")
    }
    
    func testLoginUsesExpectedQuery() {
        userLogin()
        guard let queryItems = mockURLSession.urlComponents?.queryItems else { return }
        
        let urlQueryItemLogin = URLQueryItem(name: "login", value: "login")
        let urlQueryItemPassword = URLQueryItem(name: "password", value: "password")
        
        XCTAssertTrue(queryItems.contains(urlQueryItemLogin))
        XCTAssertTrue(queryItems.contains(urlQueryItemPassword))
    }
    
    func testLoginInvalidJSONReturnsError() {
        let urlString = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/login.json"
        mockURLSession = MockURLSession(data: Data(), urlResponse: nil, responseError: nil)
        
        let errorExpectation = expectation(description: "Error expectation")
        
        var caughtError: NetworkErrors?
        sut.logIn(urlString: urlString, name: "login", password: "password") { result in
            caughtError = NetworkErrors.networkError
            errorExpectation.fulfill()
        }
        waitForExpectations(timeout: 1) { _ in
            XCTAssertNotNil(caughtError)
        }
    }
    
    func testLoginWhenDataIsNilReturnsError() {
        let urlString = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/login.json"
        mockURLSession = MockURLSession(data: nil, urlResponse: nil, responseError: nil)
        
        let errorExpectation = expectation(description: "Error expectation")
        
        var caughtError: NetworkErrors?
        sut.logIn(urlString: urlString, name: "name", password: "password") { _ in
            caughtError = NetworkErrors.dataError
            errorExpectation.fulfill()
        }
        waitForExpectations(timeout: 1) { _ in
            XCTAssertNotNil(caughtError)
        }
    }
    
    func testLoginWhenIsServerError() {
        let urlString = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/login.json"
        mockURLSession = MockURLSession(data: nil, urlResponse: nil, responseError: nil)
        
        let errorExpectation = expectation(description: "Error expectation")
        
        var caughtError: NetworkErrors?
        sut.logIn(urlString: urlString, name: "name", password: "password") { _ in
            caughtError = NetworkErrors.serverError
            errorExpectation.fulfill()
        }
        waitForExpectations(timeout: 1) { _ in
            XCTAssertNotNil(caughtError)
        }
    }

}

extension NetworkServiceTests {
    
    class MockURLSession: URLSessionProtocol {
        
        var url: URL?
        
        private let mockDataTask: MockURLSessionDataTask
        
        var urlComponents: URLComponents? {
            guard let url = url else {
                return nil
            }
            return URLComponents(url: url, resolvingAgainstBaseURL: true)
        }
        
        init(data: Data?, urlResponse: URLResponse?, responseError: Error?) {
            mockDataTask = MockURLSessionDataTask(data: data, urlResponse: urlResponse, responseError: responseError)
        }
        
        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            
            self.url = url
            mockDataTask.completionHandler = completionHandler
            
            return mockDataTask
        }
        
    }
    
    class MockURLSessionDataTask: URLSessionDataTask {
        
        private let data: Data?
        private let urlResponse: URLResponse?
        private let responseError: Error?
        
        typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
        var completionHandler: CompletionHandler?
        
        init(data: Data?, urlResponse: URLResponse?, responseError: Error?) {
            self.data = data
            self.urlResponse = urlResponse
            self.responseError = responseError
        }
        
        override func resume() {
            DispatchQueue.main.async { [weak self] in
                self?.completionHandler?(self?.data, self?.urlResponse, self?.responseError)
            }
        }
    }
}
