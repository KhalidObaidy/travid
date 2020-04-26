//
//  VerificationVC.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/21/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit
import Firebase



class VerificationVC: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var verificationView: UIView!
    @IBOutlet weak var enterBtn: UIButton!
    @IBOutlet var codeNo: UITextField!
    
    
    var ID = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        verificationView.layer.cornerRadius = 10
        //        whiteView.layer.borderWidth = 1
        //        whiteView.layer.borderColor = UIColor.lightGray.cgColor
        verificationView.layer.shadowColor = UIColor.black.cgColor
        verificationView.layer.shadowOpacity = 0.25
        verificationView.layer.shadowOffset = CGSize.zero
        verificationView.layer.shadowRadius = 5
        
        
        self.ID = UserDefaults.standard.string(forKey: "uid") ?? ""
        
        
        enterBtn.layer.cornerRadius = 5
        enterBtn.layer.shadowColor = UIColor.black.cgColor
        enterBtn.layer.shadowOpacity = 0.25
        enterBtn.layer.shadowOffset = CGSize.zero
        enterBtn.layer.shadowRadius = 5
        
        
        
        hideKeyboard()
        
        
        codeNo.delegate = self
    }
    

   
    //tabbarUser
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        codeNo.resignFirstResponder()
        return true
    }
    
    
    
    
    
    
    func navigateToAnotherView(){
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "tabbarUser") as! UserTabBar
        self.present(nextViewController, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    
    
    
    
    @IBAction func enterBtnTapped(_ sender: UIButton) {
        
        
        guard let otpCode = codeNo.text else {return}
        
        guard let verificationid = UserDefaults.standard.string(forKey: "verificationId") else {return}
        
        let credintial = PhoneAuthProvider.provider().credential(withVerificationID: verificationid, verificationCode: otpCode)
        
        
        
        
        
        Auth.auth().signInAndRetrieveData(with: credintial) { (success, error) in
            
            
            if error == nil {
                print(success)
                
                
                
                let uid = success?.user.uid
                print("credintial uid: \(uid)")
                let phoneNumber = success?.user.phoneNumber
                print("credintial phoneNumber: \(phoneNumber)")
                
                
                
                
                
                let ref = Database.database().reference().child("Individuals")
                
                ref.child(self.ID).observeSingleEvent(of: DataEventType.value, with: { (snapshot) in
                    
                    
                    if (snapshot.exists()) {
                        print(snapshot)
                        print("phone exists")
                        
                        
//                        let userData : [String : AnyObject] = ["ID" : uid as AnyObject,"DateOfBirth" : "" as AnyObject, "Email" : "" as AnyObject , "FullName" : "" as AnyObject ,"IDCard" : "" as AnyObject, "Nationality" : "" as AnyObject ,"PhoneNumber" : phoneNumber as AnyObject,"sex" : "" as AnyObject]
//
//                        ref.child(uid!).setValue(userData)
//
//
//
                        
                        
            
                        
                        
                        self.navigateToAnotherView()
                      //  appDelegate.window?.rootViewController = mainPage
                        
                        
                    }
                    
                    
//                    else if (!snapshot.exists()){
//                        print(snapshot)
//                        print("email not exists")
//
//
//                    }
                    
                })
                
                //self.navigateToAnotherView()
                ////////////////////////////////
                
            } else {
                
                print("something went wrong...  \(error?.localizedDescription)")
                
            }
            
            
        }
        
        
    }
    
    
    
    
    

    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


