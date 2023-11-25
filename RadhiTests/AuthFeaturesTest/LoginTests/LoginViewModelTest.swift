//
//  LoginViewModelTest.swift
//  RadhiTests
//
//  Created by Dalal Macbook on 21/10/2023.
//

import XCTest
@testable import Radhi

final class LoginViewModelTest: XCTestCase {

    // MARK: - Properties

    private enum Constants {
        static let mockEmail = "email@example.com"
        static let mockPassword = "aA@12345"
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    @MainActor
    func test_isLoginButtonEnabled() {
        // given
        let sut = LoginViewModel()

        // when
        sut.email = String()
        sut.password = Constants.mockPassword

        // then
        XCTAssertFalse(sut.isLoginComplete)

        // when
        sut.email = Constants.mockEmail
        sut.password = String()

        // then
        XCTAssertFalse(sut.isLoginComplete)

        // when
        sut.email = Constants.mockEmail
        sut.password = Constants.mockPassword

        // then
        XCTAssertTrue(sut.isLoginComplete)
    }

    func test_emailValidation() {
        // given
        let sut = LoginViewModel()

        // when
        sut.email = Constants.mockEmail // valid email
        sut.password = Constants.mockPassword

        // then
        XCTAssertTrue(sut.isLoginComplete)

        // when
        sut.email = "InvalidEmailFormat" // invalid email
        sut.password = Constants.mockPassword

        // then
        XCTAssertFalse(sut.isLoginComplete)
    }
}
