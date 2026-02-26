//
//  TodoVmTests.swift
//  TodoTests
//
//  Created by Elvın Yuzbayov on 2026-02-25.
//

import XCTest
@testable import Todo

@MainActor
final class TodoVmTests: XCTestCase {

    private var vm: TodoViewModel!
    
    override func setUp(){
        super.setUp()
        vm = TodoViewModel()
    }
    
    override func tearDown(){
        vm = nil
        super.tearDown()
    }

    func test_addTodo_withValidTitle_addsItemAndClearsInput(){
        let initialCount = vm.todos.count
        vm.newTitle = "Add milk"
        vm.addTodo()
        XCTAssertEqual(vm.todos.count,initialCount+1)
        XCTAssertTrue(vm.todos.contains {$0.title == "Add milk"})
        XCTAssertEqual(vm.newTitle,"")
    }
    
//    func test_addTodo_withEmptyTitle_doesNotAdd(){
//        vm.newTitle = "  "
//        vm.addTodo()
//        XCTAssertEqual(vm.todos.count,0)
//    }

}
