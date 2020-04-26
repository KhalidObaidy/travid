//
//  VisitsRecordVC.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/25/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit
import Firebase

class VisitsRecordVC: UIViewController, UITableViewDelegate, UITableViewDataSource {


    
    
    
    @IBOutlet weak var recordTable: UITableView!
    
    
    
    
    
    var recordModul = [VisitRecordModule]()
    var UserID = String()
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.UserID = UserDefaults.standard.string(forKey: "uid") ?? ""
        
        recordTable.delegate = self
        recordTable.dataSource = self
        recordTable.allowsSelection = true
        recordTable.isUserInteractionEnabled = true
        recordTable.reloadData()
        
        
        
        let nibName = UINib(nibName: "VisitsRecordTableViewCell", bundle: nil)
        recordTable.register(nibName, forCellReuseIdentifier: "visitsRecordTableViewCell")
        
        
        LoadRecordData()
        
        

        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return recordModul.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = recordTable.dequeueReusableCell(withIdentifier: "visitsRecordTableViewCell", for: indexPath) as! VisitsRecordTableViewCell
        
        
        let recordData = self.recordModul[indexPath.row]
        
        
        cell.facilityNameLabel.text = recordData.FacilityName
        cell.addressLabel.text = recordData.Addrss
        cell.dateandtimeLabel.text = recordData.DateAndTime
        
        cell.cellView.layer.cornerRadius = 10
        cell.cellView.layer.shadowColor = UIColor.black.cgColor
        cell.cellView.layer.shadowOpacity = 0.25
        cell.cellView.layer.shadowOffset = CGSize.zero
        cell.cellView.layer.shadowRadius = 5
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        
        
        return cell
        
        
    }
    
    
    
    
    
    func LoadRecordData(){
        
        
        var mudule = [VisitRecordModule]()
        
        let userRef = Database.database().reference().child("Individuals").child(self.UserID).child("LastVisits")
        
        
        userRef.observeSingleEvent(of: DataEventType.value) { (snapshot) in
            
            
            
            for child in snapshot.children {
                
                let snap = child as! DataSnapshot
                let Keys = snap.key
                print("Keys: \(Keys)")
                
                
                
                let userRecord = Database.database().reference().child("Individuals").child(self.UserID).child("LastVisits").child(Keys)
                
                
                userRecord.observeSingleEvent(of: DataEventType.value) { (snapshot) in
                    
                    
                    
                    let Values = snapshot.value as? NSDictionary
            
                    let FacilityName = Values?["FacilityName"] as? String
                    let Address = Values?["Address"] as? String
                    let DateAndTime = Values?["Date"] as? String
                    
                    
                    print("FacilityName: \(FacilityName)")
                    print("Address: \(Address)")
                    print("DateAndTime: \(DateAndTime)")
                    
                    
                    let recordDataObject = VisitRecordModule(FacilityName: FacilityName!, Addrss: Address!, DateAndTime: DateAndTime!)
                    
                    mudule.append(recordDataObject)
                    self.recordModul = mudule
                    self.recordTable.reloadData()
                    
                    
                }
                
                
            }
            
            
            
        }
        
        
        
    }
    

    
}
