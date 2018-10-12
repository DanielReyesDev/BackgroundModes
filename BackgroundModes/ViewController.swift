//
//  ViewController.swift
//  BackgroundModes
//
//  Created by Daniel Reyes Sánchez on 08/10/18.
//  Copyright © 2018 Daniel Reyes Sánchez. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var payloadLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNotificationPayload()
    }
    
    var latestMessage = ""
    private func getNotificationPayload() {
        
        UNUserNotificationCenter.current().getDeliveredNotifications { notifications in
            for aNotification in notifications{
                let payload = aNotification.request.content.userInfo
                //process the payload
                print(payload)
                guard let message = payload["message"] as? String else {return}
                self.latestMessage = message
            }
            DispatchQueue.main.sync { /* or .async {} */
                // update UI
                self.payloadLabel.text = self.latestMessage
            }
        }
    }

    


}

