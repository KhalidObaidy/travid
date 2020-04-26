//
//  ChatbotVC.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/22/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit
import Assistant
import Messages
import CoreLocation


class ChatbotVC: UIViewController{

    
    
    

    //Add the chat UI to your web page
    /*
 
     
     <script src="https://web-chat.global.assistant.watson.appdomain.cloud/loadWatsonAssistantChat.js"></script>
     <script>
     window.loadWatsonAssistantChat({
     integrationID: "16e0c5fc-fa9b-4201-b99f-9bb6d25b4d73", // The ID of this integration.
     region: "eu-gb" // The region your integration is hosted in.
     }).then(function(instance){
     instance.render();
     });
     </script>
 
 */
    
    
    
    
    
    
    
    
//    Credentials: https://api.eu-gb.assistant.watson.cloud.ibm.com/instances/df610039-df30-4ee1-8817-99ab0c6c1845
//    Api Key:YPFC06HSZq2FjcV8OIDY-AX5hMpTqe3UTNEB36wsVubJ
//    Service Credentials Name:Auto-generated service credentials
//    Skill Name:‎‪Homathon‬‎
//    Skill ID:e8be0ebf-3377-4aa3-b11b-9ab49e13f03c
//    workspace URL = https://api.eu-gb.assistant.watson.cloud.ibm.com/instances/df610039-df30-4ee1-8817-99ab0c6c1845/v1/workspaces/e8be0ebf-3377-4aa3-b11b-9ab49e13f03c/message
    
    
    
    //ASSISTANT_APIKEY=YPFC06HSZq2FjcV8OIDY-AX5hMpTqe3UTNEB36wsVubJ
    //ASSISTANT_IAM_APIKEY=YPFC06HSZq2FjcV8OIDY-AX5hMpTqe3UTNEB36wsVubJ
    //ASSISTANT_URL=https://api.eu-gb.assistant.watson.cloud.ibm.com/instances/df610039-df30-4ee1-8817-99ab0c6c1845
    //ASSISTANT_AUTH_TYPE=iam
    
    
    // (Skill ID: ) workspaceid = e8be0ebf-3377-4aa3-b11b-9ab49e13f03c
    //    Workspace URL: https://api.eu-gb.assistant.watson.cloud.ibm.com/instances/df610039-df30-4ee1-8817-99ab0c6c1845/v1/workspaces/e8be0ebf-3377-4aa3-b11b-9ab49e13f03c/message
    
    
    var messageList = [String]()

    
    
    
    //Version: Development
    
    let versionData = DateFormatter()
    let apiKey = "YPFC06HSZq2FjcV8OIDY-AX5hMpTqe3UTNEB36wsVubJ" // good
    let version = "2020-04-22" // use today's date for the most recent version
    let AssistantID = "279bf9a8-a3e2-4a56-89cf-e7624603b85e"
    let sessionID = "e8be0ebf-3377-4aa3-b11b-9ab49e13f03c"
  //  let assistant = Assistant(version: "", apiKey: "")
    var context: MessageContext?
    
    
    
    
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let authenticator = WatsonIAMAuthenticator(apiKey: apiKey)
        let assistant = Assistant(version: version, authenticator: authenticator)
        
     
        
        assistant.serviceURL = "https://api.eu-gb.assistant.watson.cloud.ibm.com/instances/df610039-df30-4ee1-8817-99ab0c6c1845"
        
     //   assistant.serviceURL = "https://api.eu-gb.assistant.watson.cloud.ibm.com/instances/c10941d0-8926-4cdd-956a-005f05f02004/v2/assistants/27b3a262-cc3a-46c8-97f8-ba80c6cb61ce/sessions"
        
        beginConversation(sessionID: sessionID)
        
        
        
       
        
        
        

    }
    
    
    

    
    
    

    func beginConversation(sessionID: String){


//        versionData.dateFormat = "2020-04-22"
//
//        let assistant = Assistant(version: versionData.dateFormat, authenticator: self.apiKey)
//
        
        
        
        let authenticator = WatsonIAMAuthenticator(apiKey: apiKey)
        let assistant = Assistant(version: version, authenticator: authenticator)
        
        
        

        // Start a conversation
        assistant.message(assistantID: AssistantID, sessionID: sessionID) { response, error in
            if let error = error {
                print(error)
            }
            guard let message = response?.result else {
                print("Failed to get the message")
                return
            }
            self.context = message.context
            message.output.generic?.forEach({ response in
                print(response.text ?? "No response")
            })
            self.respond(sessionID: sessionID) // See the next code snippet
        }




    }




    func respond(sessionID: String) {
        
        
        let authenticator = WatsonIAMAuthenticator(apiKey: apiKey)
        let assistant = Assistant(version: version, authenticator: authenticator)
        
        
        let messageInput = MessageInput(
            messageType: MessageInput.MessageType.text.rawValue,
            text: "Turn on the radio"
        )
        assistant.message(
            assistantID: AssistantID,
            sessionID: sessionID,
            input: messageInput,
            context: context) { response, error in

                if let error = error {
                    print(error)
                }
                guard let message = response?.result else {
                    print("Failed to get the message")
                    return
                }
                self.context = message.context
                message.output.generic?.forEach({
                    response in
                    print(response.text ?? "No response")
                })
        }
    }

//
//
//
//
//
//
//    @IBAction func sendMessage(_ sender: Any) {
//
////
////
////        if let text = self.inputTextField.text {
////            if text.count > 0 {
////                let id = UUID().uuidString
////                let message = AssistantMessages.init(type: MessageType.text, owner: MessageOwner.receiver, content: text, isRead: true, messageId: id, sentDate: Date())
////                messageList.append(message)
////                tableView.reloadData()
////                self.tableView.scrollToRow(at: IndexPath.init(row: self.messageList.count - 1, section: 0), at: .bottom, animated: true)
////
////                self.inputTextField.text = ""
////            }
////        }
//
//
//        print("Request: When are you open?")
//        let input = MessageInput(text: "When are you open?")
//
//
//
//        let userFeedback = "I am sick"
//
//
//
//
//
//
//        assistant.message(assistantID: AssistantID, sessionID: sessionID, input: input, context: self.context) { response, error in
//            if let error = error {
//                print(error)
//            }
//
//            guard let message = response?.result else {
//                print("Failed to get the message.")
//                return
//            }
//
//            print("Conversation ID: \(message.context.debugDescription)")
//           // print("Response: \(message.output.intents)")
//
//            // Update the context
//            self.context = message.context
//        }
//
//
//    }
//
//
//
    
   
    
    
    
}
