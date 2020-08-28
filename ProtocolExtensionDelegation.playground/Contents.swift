import Foundation

protocol A: class {}

extension A {
    func someFunc() {
        print("1")
    }
}

class B {
    weak var delegate: A?
    
    func someTrigger() {
        delegate?.someFunc()
    }
}

class C: A {
    lazy var b: B = {
        let b = B()
        b.delegate = self
        return b
    }()
    
    func someFunc() {
        print("2")
    }
    
    init() {
        b.someTrigger()
    }
}

let c = C()
