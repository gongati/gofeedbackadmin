//
//  AdminHiomeViewController.swift
//  gofeedback
//
//  Created by Vishnu Vardhan Reddy G on 03/05/20.
//  Copyright © 2020 Vishnu. All rights reserved.
//

import UIKit

class AdminHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.shouldShowLogin() {
            
            self.showUserLogin()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        print("viewdid appear")
    }
    
    func gotoHomeScreen() {
        let mainStory = UIStoryboard(name: "Main", bundle: nil)
        let vc:HomeViewController = mainStory.instantiateViewController(withIdentifier: "GFNAVIGATEMENUHOME") as! HomeViewController
        let navController = UINavigationController(rootViewController: vc)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = navController
    }
    
    func shouldShowLogin() -> Bool {
        
        guard let loginStatus = UserDefaults.standard.value(forKey: "loginStatus") as? Bool else
        {
            return true
        }
        
        return !loginStatus
    }
    
    func popupAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        let app = UIApplication.shared
        app.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }

    func showUserLogin() {
        if let controller = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController() {
            
            let navController = UINavigationController(rootViewController: controller)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true, completion: nil)
        }
    }
}
