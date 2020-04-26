//
//  FacilityProfileVC.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/23/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit
import Firebase

class FacilityProfileVC: UIViewController {
    
    
    @IBOutlet weak var PView: UIView!
    @IBOutlet weak var IView: UIView!
    
    @IBOutlet weak var logoutBtn: UIButton!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var crnoLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    

    
    var facilityID = String()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        self.facilityID = UserDefaults.standard.string(forKey: "facilityID") ?? ""
        
        
        
        LoadProfileData()
        
        
        PView.layer.cornerRadius = 10
        //        whiteView.layer.borderWidth = 1
        //        whiteView.layer.borderColor = UIColor.lightGray.cgColor
        PView.layer.shadowColor = UIColor.black.cgColor
        PView.layer.shadowOpacity = 0.25
        PView.layer.shadowOffset = CGSize.zero
        PView.layer.shadowRadius = 5
        
        
        
        
        IView.layer.cornerRadius = 10
        //        whiteView.layer.borderWidth = 1
        //        whiteView.layer.borderColor = UIColor.lightGray.cgColor
        IView.layer.shadowColor = UIColor.black.cgColor
        IView.layer.shadowOpacity = 0.25
        IView.layer.shadowOffset = CGSize.zero
        IView.layer.shadowRadius = 5
        
        
        logoutBtn.layer.cornerRadius = 5
        logoutBtn.layer.shadowColor = UIColor.black.cgColor
        logoutBtn.layer.shadowOpacity = 0.25
        logoutBtn.layer.shadowOffset = CGSize.zero
        logoutBtn.layer.shadowRadius = 5
        
        
        
        

    }
    

 
    
    
    
    
    func LoadProfileData(){
        
        
        
        let facilityRef = Database.database().reference().child("Facilities").child(self.facilityID)
        
        
        facilityRef.observeSingleEvent(of: DataEventType.value) { (snapshot) in
            
            
            let Values = snapshot.value as? NSDictionary
            
            
            
            let address = Values?["Address"] as? String
            let CRNo = Values?["CRNo"] as? String
            let FacilityName = Values?["FacilityName"] as? String
            let Password = Values?["Password"] as? String
            let PhoneNumber = Values?["PhoneNumber"] as? String
            let Username = Values?["Username"] as? String
            //     print("uid: \(String(describing: uid))")
            
            
            
            print("address:  \(address)")
            print("CRNo:  \(CRNo)")
            print("FacilityName:  \(FacilityName)")
            
            print("Password:  \(Password)")
            print("PhoneNumber:  \(PhoneNumber)")
            print("Username:  \(Username)")

            
            
            
            
            self.usernameLabel.text = Username
            self.passwordLabel.text = Password
            self.nameLabel.text = FacilityName
            
            self.crnoLabel.text = CRNo
            self.phoneNumberLabel.text = PhoneNumber
            self.addressLabel.text = address
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    @IBAction func logoutBtnTapped(_ sender: UIButton) {
        
        
        do
        {
            UserDefaults.standard.removeObject(forKey: "facilityID")
            try Auth.auth().signOut()

        }
            
            
        catch let error as NSError
        {
            print(error.localizedDescription)
        }
        
    }
    
    
    

}
