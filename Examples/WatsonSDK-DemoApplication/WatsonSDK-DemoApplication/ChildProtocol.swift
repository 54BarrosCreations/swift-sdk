//
//  ChildProtocol.swift
//  WatsonSDK-DemoApplication
//
//  Created by Ruslan Ardashev on 12/1/15.
//  Copyright © 2015 ibm.mil. All rights reserved.
//

import Foundation

/** Intended for child **UIViewController**s to implement. */
protocol ChildProtocol: class {
    
    var childTitle: String! { get }
    var config: [String : String]! { get }
    
}
