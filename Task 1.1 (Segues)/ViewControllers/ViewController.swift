//
//  ViewController.swift
//  Task 1.1 (Segues)
//
//  Created by Паша on 29/04/2019.
//  Copyright © 2019 Паша. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var buttonNum = 0
    
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    
    @IBAction func ForgotPassword(_ sender: UIButton) {
        buttonNum = 1
    }
    @IBAction func ForgotLogin(_ sender: UIButton) {
        buttonNum = 2
    }
    @IBAction func SignIn(_ sender: Any) {
        buttonNum = 3
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keybShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keybHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        self.hideKeyboard()
    }
    
    }

// MARK: - To hide keyboard
extension UIViewController {
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

// MARK: - keyboard

extension ViewController {
    @objc func keybShow (notification: Notification) {
        guard let userInfo = notification.userInfo else {return}
        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height + kbFrameSize.height)
        
        //self.view.convert(buttonSign.frame, to: buttonSign.superview).minY  - Координаты объекта
        
        (self.view as! UIScrollView).scrollIndicatorInsets = UIEdgeInsets(top: 0,
                                                                          left: 0,
                                                                          bottom: kbFrameSize.height,
                                                                          right: 0)


    }
    @objc func keybHide (notification: Notification) {
        (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    
}

// MARK: - prepare Segue
extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SegueViewController else {return}
        switch buttonNum {
        case 1:
            destination.TextofLabel = "Your password: \"kukushka\""
            destination.NavigationT = "Password"
        case 2:
            destination.TextofLabel = "Your login: \"Jack\""
            destination.NavigationT = "Login"
        case 3:
            guard let login = loginField.text, let pass = passwordField.text else {return}
            if login == "Jack" && pass == "kukushka" {
                destination.TextofLabel = "Authentification\n successfully!"
                destination.NavigationT = "Success"
            } else {
                destination.TextofLabel = "Wrong login or password!"
                destination.NavigationT = "Sorry!"
            }
        default:
            print ("No work!")
        }
        
    }
}



