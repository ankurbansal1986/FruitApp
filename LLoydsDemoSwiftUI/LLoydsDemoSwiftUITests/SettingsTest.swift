//
//  SettingsTest.swift
//  LLoydsDemoSwiftUITests
//
//  Created by Ankur Bansal on 10/03/24.
//

import XCTest
@testable import LLoydsDemoSwiftUI
final class SettingsViewTest: XCTestCase {
    func testSettingsView() {
        let settingsView = SettingsView().environmentObject(Theme())
        let viewControler = settingsView.toViewController()
        viewControler.performSnapshotTests(named: "SettingsView")
    }
}
