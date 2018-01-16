//
//  Test.swift
//  
//
//  Created by Bezançon on 16/01/2018.
//

import Foundation


public class Test // -Test
{
    public static func run()
    {
        let app: Firelight = Firelight()
        app.dispList()
        
        let device = app.pickDevice()
        app.controlDevice(device)
    }
}
