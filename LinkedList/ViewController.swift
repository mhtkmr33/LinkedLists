//
//  ViewController.swift
//  LinkedList
//
//  Created by Mohit Kumar on 26/05/20.
//  Copyright © 2020 Mohit Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //USAGE
        let linkedListObject = SinglyLinkedList<Int>()
        linkedListObject.add(value: 1)
        linkedListObject.add(value: 2)
        linkedListObject.add(value: 3)
        linkedListObject.add(value: 4)
        linkedListObject.displayList() // 1 2 3 4
        linkedListObject.delete(value: 2)
        linkedListObject.displayList() // 1 3 4
        linkedListObject.reverse()
        linkedListObject.displayList() // 4 3 1
    }
}

class Node<T> {
    var value: T
    var next: Node<T>?
    init(value: T, next: Node<T>?) {
        self.value = value
        self.next = next
    }
}

class SinglyLinkedList<T: Equatable> {
    
    var head: Node<T>?
    
    func add(value: T) {
        let newNode = Node(value: value, next: nil)
        if head == nil {
            head = newNode
            return
        }
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = newNode
    }

    func delete(value: T) {
        if head?.value == value {
            head = head?.next
            return
        }
        var currentNode = head
        var previousNode: Node<T>?
        var nextNode: Node<T>?
        while currentNode?.next != nil {
            previousNode = currentNode
            nextNode = currentNode?.next
            if nextNode?.value == value {
                previousNode?.next = nextNode?.next
            }
            currentNode = nextNode
        }
        //Taking care of if last node of the list is the node that we need to delete.
        if currentNode?.value == value {
            previousNode?.next = nil
        }
    }
    
    func reverse() {
        var currentNode = head
        var nextNode: Node<T>?
        var previousNode: Node<T>?
        while currentNode?.next != nil {
            nextNode = currentNode?.next
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
        }
        currentNode?.next = previousNode
        head = currentNode
    }
    
    func displayList() {
        var currentNode = head
        while  currentNode?.next != nil {
            print(currentNode?.value ?? "No value")
            currentNode = currentNode?.next
        }
        print(currentNode?.value ?? "No value")
    }
}
