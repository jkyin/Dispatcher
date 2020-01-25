//
//  QuizCode.swift
//  Dispatcher
//
//  Created by Besher on 2020-01-24.
//  Copyright © 2020 Besher Al Maleh. All rights reserved.
//

import Foundation

struct QuizCode {
    
    static let list: [String] = [q1, q2, q3]
    
    private static let q1 = """
    let concurrent = DispatchQueue(label: "concurrent", attributes: .concurrent)
    
    concurrent.sync {
        for _ in 0..<5 { print("♦️") }
    }
    
    concurrent.async {
        for _ in 0..<5 { print("♥️") }
    }
    """
    
    private static let q2 = """
    let array = Array(51...70)
    
    DispatchQueue.global().async {
        // Loop A
        for i in 0..<10 {
            print(array[i])
        }
    }
    
    DispatchQueue.global().async {
        // Loop B
        for i in 10..<20 {
            print(array[i])
        }
    }
    """
    
    private static let q3 = """

    let concurrent = DispatchQueue(label: "concurrent", attributes: .concurrent)
    
    concurrent.async {
        
        for i in 1...5 {
            print(i)
        }
        
        for _ in 1...5 {
            print("♦️")
        }
        
        for _ in 1...5 {
            print("♥️")
        }
    }

    """
    
    private static let q4 = """
    class ViewController: UIViewController {
        var textLabel: UILabel = UILabel()
        override func viewDidLoad() {
    
            let index = 55
            let text = "Fibbonacci Number at \(index) is equal to "
    
            DispatchQueue.global().sync {
                // calculateFibonnaci(at:) is unoptimized, requires several seconds
                let fibonnacci: Int = calculcateFibonacci(at: index)
    
                DispatchQueue.main.sync {
                    self.textLabel.text = text + String(fibonnacci)
                }
            }
        }
    }
    """
    
    private static let q5 = """
    DispatchQueue.global().async {
        
        DispatchQueue.global(qos: .userInteractive).async {
            print("🌙🌙🌙🌙")
        }
        
        print("☀️☀️☀️☀️")
    }
    """
    
    private static let q6 = """
    let serialQueue = DispatchQueue(label: "serial")
    
    func processImage(data: Data) -> UIImage? {
        guard let image = UIImage(data: data) else { return nil }
        
        return serialQueue.sync {
            tint(image: image)
        }
    }

    func tint(image: UIImage) -> UIImage { ... }
    """
    
    private static let q7 = """
    let serial1 = DispatchQueue(label: "serial1")
    let serial2 = DispatchQueue(label: "serial2")
    
    serial1.async {
        for _ in 0..<5 { print("🐮") }
    }
    
    serial2.async {
        for _ in 0..<5 { print("🐶") }
    }
    """
    
    private static let q8 = """
    var array = [1,2,3,4,5]

    DispatchQueue.global().async {
        for i in 0..<10 {
            array.append(i)
        }
    }
        
    DispatchQueue.global().async {
        for i in array {
            print(i)
        }
    }
    """
    
    private static let q9 = """
    let array = [1,2,3,4,5]
    
    let serial = DispatchQueue(label: "serial")
    
    serial.async {
        for i in array {
            serial.async {
                for j in array {
                    print(i * j)
                }
            }
        }
    }
    """
    
    private static let q10 = """
    let serial = DispatchQueue(label: "serial")
    
    serial.async {
        for i in 1...10 {
            print(i)
        }
    }
    
    serial.sync {
        for i in 11...20 {
            print(i)
        }
    }
    
    serial.async {
        for i in 21...30 {
            print(i)
        }
    }
    """
}
