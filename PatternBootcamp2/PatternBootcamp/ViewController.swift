//
//  ViewController.swift
//  PatternBootcamp
//
//  Created by Gustavo Evangelista on 21/06/24.
//

import UIKit

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func soma(a: Int, b: Int) -> Int {
        return a + b
    }

}

