//
//  ViewController.swift
//  Phidgets_DigitalInput_Test
//
//  Created by Joel Igberase on 2019-04-17.
//  Copyright © 2019 Joel Igberase. All rights reserved.
//

import UIKit
import Phidget22Swift

class ViewController: UIViewController {

    let button = DigitalInput()
    
    func attach_handler(sender: Phidget){
        print("Button Attached")
    }
    
    func state_change(sender: DigitalInput, state: Bool){
        if(state == true){
            print("Button Pressed")
        }
        else{
            print("Button Not Pressed")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do {
            //enable server discovery
            try Net.enableServerDiscovery(serverType: .deviceRemote)
            
            //address object
            try button.setDeviceSerialNumber(528025)
            try button.setHubPort(0)
            try button.setIsHubPortDevice(true)
            
            //add attach handler
            let _ = button.attach.addHandler(attach_handler)
            
            //add state change handler
            let _ = button.stateChange.addHandler(state_change)
            
            //open object
            try button.open()
            
        } catch let err as PhidgetError {
            print("Phidget Error " + err.description)
        } catch {
            //catch other errors here
        }
    }
}

