//
//  FacilityLoginPageVC.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/23/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit
import Firebase

class FacilityLoginPageVC: UIViewController, UITextFieldDelegate  {

    
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet var usernameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        loginView.layer.cornerRadius = 10
        loginView.layer.shadowColor = UIColor.black.cgColor
        loginView.layer.shadowOpacity = 0.25
        loginView.layer.shadowOffset = CGSize.zero
        loginView.layer.shadowRadius = 5
        
        
        
        
        
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.shadowColor = UIColor.black.cgColor
        loginBtn.layer.shadowOpacity = 0.25
        loginBtn.layer.shadowOffset = CGSize.zero
        loginBtn.layer.shadowRadius = 5
        
        
        
        
        
        
        usernameText.delegate = self
        passwordText.delegate = self
        
        
        
        
        
        
        
        
        hideKeyboard()
        
        
        
    }
    
    
    
    
    
    
    
    
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: usernameText.text!, password: passwordText.text!) { (result, error) in
            
            
            
            let facilityID = result?.user.uid
            
            
            
            if let error = error {
                print(error.localizedDescription)
            }
            else if let result = result {
                print(result)
                
                print("facilityID: \(facilityID)")
                UserDefaults.standard.set(facilityID, forKey: "facilityID")
                
                self.navigateToAnotherView()
            }
            
            
        }

        
    }
    
    
    
    
    
    
    
    func navigateToAnotherView(){
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "facilityTabBar") as! FacilityTabBar
        self.present(nextViewController, animated: true, completion: nil)
        
        
        
    }
    
    
    


}
