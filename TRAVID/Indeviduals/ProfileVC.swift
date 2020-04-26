//
//  ProfileVC.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/21/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {

    
    
    @IBOutlet weak var PView: UIView!
    @IBOutlet weak var IView: UIView!
    @IBOutlet weak var logoutBtn: UIButton!
    
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var NationalID: UILabel!
    @IBOutlet weak var PhoneNumberLabel: UILabel!
    @IBOutlet weak var BirthdayLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var GenderLabel: UILabel!
    @IBOutlet weak var NationalityLabel: UILabel!
    
    
    var UserID = String()
    var PhoneNumber = String()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //PhoneNumber
        self.UserID = UserDefaults.standard.string(forKey: "uid") ?? ""
        
        print("UserID:  \(UserID)")
        
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



        let userRef = Database.database().reference().child("Individuals").child(self.UserID)


        userRef.observeSingleEvent(of: DataEventType.value) { (snapshot) in


            let Values = snapshot.value as? NSDictionary
            

            
            let DateOfBirth = Values?["DateOfBirth"] as? String
            let Email = Values?["Email"] as? String
            let FullName = Values?["FullName"] as? String
            let IDCard = Values?["IDCard"] as? String
            let phone = Values?["PhoneNumber"] as? String
            let Nationality = Values?["Nationality"] as? String
            let gender = Values?["sex"] as? String
            //     print("uid: \(String(describing: uid))")
            
            
            
            print("FullName:  \(FullName)")
            print("IDCard:  \(IDCard)")
            print("PhoneNumber:  \(phone)")
            
            print("DateOfBirth:  \(DateOfBirth)")
            print("EmailLabel:  \(Email)")
            print("GenderLabel:  \(gender)")
            print("NationalityLabel:  \(Nationality)")

            
            
 
            self.NameLabel.text = FullName
            self.NationalID.text = IDCard
            self.PhoneNumberLabel.text = phone
            
            self.BirthdayLabel.text = DateOfBirth
            self.EmailLabel.text = Email
            self.GenderLabel.text = gender
            self.NationalityLabel.text = Nationality
            
        }
        
    }

    
    
    
    
    
    
    
    
    @IBAction func logoutBtnTapped(_ sender: UIButton) {
        
        
        do
        {
            try Auth.auth().signOut()
            
            
            UserDefaults.standard.removeObject(forKey: "uid")
            UserDefaults.standard.removeObject(forKey: "PhoneNumber")
            
        }
        catch let error as NSError
        {
            print(error.localizedDescription)
        }
        
    }
    
    
    
    
    
    


}
