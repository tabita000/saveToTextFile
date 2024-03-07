//
//  ViewController.swift
//  saveToTextFile
//
//  Created by Tabita Sadiq on 3/7/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func writeMyText(_ sender: Any) { //first button - write text
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text") //mean whatever is in the typeTextHere will append to the seconf textView i.e displayTextHere
        do { //this is called a "do catch". purpose is if there are bugs the program crashes but this is like error handling. if there is an error will print a msg for user to see"error writing file"
            try typeTextHere.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Error writing file")
        }
        
    }
    
    
    @IBAction func readMyText(_ sender: Any) { //second button - read text
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            displayTextHere.text = fileContent
            
        } catch{
            print("Error reading file")
            
        }
    }
    
   
    @IBOutlet weak var typeTextHere: UITextView! //for the first text view
    
    
    
    @IBOutlet weak var displayTextHere: UITextView!// second text view
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        typeTextHere.text = "Type Your new text right here"
        displayTextHere.text = ""
        
        
    }


}

