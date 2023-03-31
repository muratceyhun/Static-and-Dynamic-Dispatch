//
//  main.swift
//  Static and Dynamic Dispatch
//
//  Created by Murat Ceyhun Korpeoglu on 20.03.2023.
//

import Foundation

//class A {
//
//    func execute(number: Int = 0) {   //Dynamic Dispatch(Table)
//        print("A: \(number)")
//    }
//}
//
//class B: A {
//
//    override func execute(number: Int = 1) {
//        print("B: \(number)")
//    }
//}
//let instance: A = B()
//instance.execute()

protocol Shape {
    func draw()           //Dynamic
}

extension Shape {
    func draw() {
        print("Shape")
    }
    func area() {
        print("Shape")    //Static
    }
}

class Circle: Shape {
    func draw() {
        print("Circle")   //Dynamic
    }
    func area() {
        print("Circle")   //Dynamic
    }
}

let circle: Shape = Circle()

circle.draw()
circle.area()


/*Method Dispatch
Method dispatching is when a program is executing and faces a method call. The program needs to dispatch to the address of this method’s implementation. Sometimes we expect that the implementation for a method is determined only at runtime.

Swift provides multiple dispatching mechanisms sorted by speed:

Static Dispatch
V-Table Dispatch
Message Dispatch
In this article, we will be referring to the V-Table Dispatch and Message Dispatch as “Dynamic Dispatch”. They both have the same behavior of identifying which implementation to be used at runtime but with different performances.

We will be more focusing on the differences between Static and Dynamic dispatch.

Dynamic Dispatch
This is a mechanism of choosing the method implementation to be used at runtime. So, when the program hits a function call, it starts searching for the correct implementation that should be executed and jumps to it. This searching step makes it an overhead which makes it slower.

Why is it being used? Because it is flexible. Thanks to dynamic dispatch, developers can now define the method only one time and provide multiple implementations for it. The compiler with the help of the dynamic dispatch can now choose the correct implementation for this method.

Most of us are using the power of dynamic dispatch in our daily development without noticing it; It allows the existence of Polymorphism and the Protocol pattern. As mentioned, in these cases you only need to define the method in 1 place and implement it in multiple classes and the dynamic dispatch will take care of you.

Static Dispatch
Sometimes referred to as “Direct dispatch”. At compile time the compiler already knows which implementation will be used if the method is called. So, when the function is called the program jumps directly to the address that was generated while compiling.
 
 Deciding the dispatching mechanism
 Swift always tries to prioritize static dispatching for better performance.

 Examples
 Value Types
 Since structs and enums are value types, which don’t support inheritance, all method calls will use static dispatch. The compiler knows there will be only 1 implementation for each method at runtime.

 Protocol
 All methods defined in the protocol itself will be dispatched dynamically but any method defined inside a protocol's extension will be dispatched statically.
 
 Class
 As a class can be inherited, the default dispatching mechanism is Dynamic dispatch.

 It’s the developer’s responsibility to help the compiler optimize its performance. How?

 The compiler will dispatch the method statically in any of these cases:

 The class is marked final
 The method is marked private or final. As a private method can’t be overridden by subclasses
 The method is defined in an extension
 Note that when annotating a method with @objc or dynamic will override the dispatching mechanism to be dynamic dispatch
 
 
*/




//What is method swizzling?
//Method swizzling is the process of changing the implementation of an existing selector at runtime. Simply speaking, we can change the functionality of a method at runtime.This is possible with the power of objective C runtime.

