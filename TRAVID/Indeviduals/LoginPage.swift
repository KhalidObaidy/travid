//
//  ViewController.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/21/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit
import Firebase

class LoginPage: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet var nationalID: UITextField!
    @IBOutlet var phoneNumber: UITextField!

    
    
    var phone = String()
    var IDCard = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboard()
        
        Auth.auth().languageCode = "ar";
        
        
        
        loginView.layer.cornerRadius = 10
        //        whiteView.layer.borderWidth = 1
        //        whiteView.layer.borderColor = UIColor.lightGray.cgColor
        loginView.layer.shadowColor = UIColor.black.cgColor
        loginView.layer.shadowOpacity = 0.25
        loginView.layer.shadowOffset = CGSize.zero
        loginView.layer.shadowRadius = 5
        
        
        
        
        
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.shadowColor = UIColor.black.cgColor
        loginBtn.layer.shadowOpacity = 0.25
        loginBtn.layer.shadowOffset = CGSize.zero
        loginBtn.layer.shadowRadius = 5
        
        
        
        
        
        
        nationalID.delegate = self
        phoneNumber.delegate = self
        
        
        
        
    }

    
    
    
    
    
    
    func signInUsinfPhoneNumber(){
        
        
        
        if (nationalID.text != nil && nationalID.text != "") {
            
            if (phoneNumber.text != nil && phoneNumber.text != "") {
                
                
                guard let phoneNumber = self.phoneNumber.text else {return}
                
                
                PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verification, error) in
                    
                    if error == nil {
                        print(verification)
                        
                        
                        guard let verifyId = verification else {return}
                        
                        UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
                        UserDefaults.standard.set(verifyId, forKey: "verificationId")
                        UserDefaults.standard.synchronize()
                        
                        
                        self.checkUserInputValues()
                        
                        
                        
                    } else {
                        
                        self.FirebaseWarningAlert()
                        
                    }
                
                    
                }
                
                
            } else {
                
                emptyPhoneNumberWarningAlert()
            }
            
        } else {
            
            emptyIDCardWarningAlert()
            
        }
        
        
    }
    
    
    func checkUserInputValues(){
        
        
        let Ref = Database.database().reference().child("Individuals")
        
        Ref.observeSingleEvent(of: DataEventType.value, with: { (snapshot) in
            
            for child in snapshot.children {
                
                let snap = child as! DataSnapshot
                let Keys = snap.key
                print("Keys: \(Keys)")
                
                
                
                let userRef = Database.database().reference().child("Individuals").child(Keys)
                
                
                
                userRef.observeSingleEvent(of: DataEventType.value, with: { (snapshot) in
                    
                    
                    print(snapshot)
                    

                        let Values = snapshot.value as? NSDictionary
                        let PhoneNumberOfUser = Values?["PhoneNumber"] as? String
                        let ID = Values?["ID"] as? String
                        print("PhoneNumber:  \(PhoneNumberOfUser)")
                        print("ID:  \(ID)")
                        
                        if (self.phoneNumber.text == PhoneNumberOfUser){
                            
                            UserDefaults.standard.set(ID, forKey: "uid")
                            
                            self.moveToVerificationVC()
                            
                            
                        }
                        
                    
//
//                        else if (self.phoneNumber.text != PhoneNumberOfUser) {
//
////                            UserDefaults.standard.removeObject(forKey: "phoneNumber")
////                            UserDefaults.standard.removeObject(forKey: "verificationId")
//                            print("phoneNumber is not stored in Firebase")
//                        }
                    

                    
                    
                })
                
                
                
                
            }
            
            
        })
        
        
    }
    
    
    
    
    
    
    func FirebaseWarningAlert(){
        let alert = UIAlertController(title: "Enable to get Secret Verification Code from Firebase", message:
            "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .cancel))
        alert.view.tintColor = .black
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    func WarningAlert(){
        let alert = UIAlertController(title: "The National ID or Phone Number provided is incorrect", message:
            "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .cancel))
        alert.view.tintColor = .black
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func emptyIDCardWarningAlert(){
        let alert = UIAlertController(title: "Enter the ID Number", message:
            "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .cancel))
        alert.view.tintColor = .black
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func emptyPhoneNumberWarningAlert(){
        let alert = UIAlertController(title: "Enter the Phone Number", message:
            "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .cancel))
        alert.view.tintColor = .black
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    func moveToVerificationVC(){
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "verificationVC") as! VerificationVC
        self.present(nextViewController, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    
    
    
    @IBAction func signinBtnTapped(_ sender: UIButton) {
        
        signInUsinfPhoneNumber()
        
    }
    
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nationalID.resignFirstResponder()
        phoneNumber.resignFirstResponder()
        return true
    }
    
    
    
}

