//
//  FacilityRegisterPageVC.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/23/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit
import Firebase




class FacilityRegisterPageVC: UIViewController, UITextFieldDelegate  {

    
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet var usernameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var CRNoText: UITextField!
    @IBOutlet var FacilityNameText: UITextField!
    @IBOutlet var AddressText: UITextField!
    @IBOutlet var PhoneNumberText: UITextField!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        registerView.layer.cornerRadius = 10
        registerView.layer.shadowColor = UIColor.black.cgColor
        registerView.layer.shadowOpacity = 0.25
        registerView.layer.shadowOffset = CGSize.zero
        registerView.layer.shadowRadius = 5
        
        
        
        
        
        registerBtn.layer.cornerRadius = 5
        registerBtn.layer.shadowColor = UIColor.black.cgColor
        registerBtn.layer.shadowOpacity = 0.25
        registerBtn.layer.shadowOffset = CGSize.zero
        registerBtn.layer.shadowRadius = 5
        
        
        
        
        
        
        usernameText.delegate = self
        passwordText.delegate = self
        CRNoText.delegate = self
        FacilityNameText.delegate = self
        AddressText.delegate = self
        PhoneNumberText.delegate = self
        
        
        
        
        
        
        hideKeyboard()
        
        
        
        

    }
    

   
    
    
    @IBAction func registertnTapped(_ sender: UIButton) {
        
        Auth.auth().createUser(withEmail: usernameText.text!, password: passwordText.text!) { authResult, error in
            
            
            
            if let _eror = error {
                //something bad happning
                print(_eror.localizedDescription )
            }else{
                //user registered successfully
                print(authResult)
                
                
                
                
                
                let uid = authResult?.user.uid
                print("Facility uid: \(uid)")
                
                
                
                
                let ref = Database.database().reference().child("Facilities")
                
                ref.child(uid!).observeSingleEvent(of: DataEventType.value, with: { (snapshot) in
                    
                    
                    if (snapshot.exists()) {
                        print(snapshot)
                        print("Facility exists")
                        
                        self.FirebaseWarningAlert()
                        
                    }
                        
                    else if (!snapshot.exists()){
                        print(snapshot)
                        print("Facility not exists")
                        
                        
                        let facilityData : [String : AnyObject] = ["ID" : uid as AnyObject,"Username" : self.usernameText.text as AnyObject, "Password" : self.passwordText.text as AnyObject , "CRNo" : self.CRNoText.text as AnyObject ,"FacilityName" : self.FacilityNameText.text as AnyObject, "Address" : self.AddressText.text as AnyObject ,"PhoneNumber" : self.PhoneNumberText.text as AnyObject]
                        
                        ref.child(uid!).setValue(facilityData)
                        
                        
                        UserDefaults.standard.set(uid, forKey: "facilityID")
                        
                        self.navigateToAnotherView()
                        
                    }
                    
                    
                    
                    
                    
                })
                
                
                
                
                
                
                
            }
            
            
            
            
            
            
            
            
            
        }
        
    }
    
    
    
    
    
    
    
    func navigateToAnotherView(){
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "facilityTabBar") as! FacilityTabBar
        self.present(nextViewController, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    func FirebaseWarningAlert(){
        let alert = UIAlertController(title: "You Already Have An Account", message:
            "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .cancel))
        alert.view.tintColor = .black
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    

}
