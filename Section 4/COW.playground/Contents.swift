//: Playground - noun: a place where people can play

import Foundation

var str = "Hello, playground"

fileprivate class BackendQueue<T> {
    private var items = [T]()

    public init() {}
    private init(_ items: [T]) {
        self.items = items
    }

    public func addItem(item: T) {
        items.append(item)
    }

    public func getItem() -> T? {
        if items.count > 0 {
            return items.remove(at: 0)
        } else {
            return nil
        }
    }
    public func count() -> Int {
        return items.count
    }
    public func copy() -> BackendQueue<T> {
        return BackendQueue<T>(items)
    }
}

struct Queue {
    private var internalQueue = BackendQueue<Int>()

    mutating private func checkUniquelyReferencedInternalQueue() {
        if !isKnownUniquelyReferenced(&internalQueue) {
            print("Making a copy of internalQueue")
            internalQueue = internalQueue.copy()
        } else {
            print("Not making a copy of internalQueue")
        }
    }

    public mutating func addItem(item: Int) {
        checkUniquelyReferencedInternalQueue()
        internalQueue.addItem(item: item)
    }
    public mutating func getItem() -> Int? {
        checkUniquelyReferencedInternalQueue();
        return internalQueue.getItem()
    }
    public func count() -> Int {
        return internalQueue.count()
    }
    mutating public func uniquelyReferenced() -> Bool{
        return isKnownUniquelyReferenced(&internalQueue)
    }
}

fileprivate var queue1 = BackendQueue<Int>()
queue1.addItem(item: 1)
queue1.addItem(item: 2)

isKnownUniquelyReferenced(&queue1)

fileprivate var queue2 = queue1

isKnownUniquelyReferenced(&queue1)

var queue3 = Queue()
queue3.addItem(item: 1)

print(queue3.uniquelyReferenced())

var queue4 = queue3

print(queue3.uniquelyReferenced())
print(queue4.uniquelyReferenced())

queue3.addItem(item: 2)

print(queue3.uniquelyReferenced())
print(queue4.uniquelyReferenced())
queue4.addItem(item: 3)
queue3.addItem(item: 4)

print(queue3.count())
print(queue4.count())
