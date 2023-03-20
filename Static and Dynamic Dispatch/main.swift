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
//
//
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
