//
//  ViewController.swift
//  AdmissionPrediction
//
//  Created by Macbook Pro on 07/05/2021.
//

import UIKit

class ViewController: UIViewController {

    var name = ""
    @IBOutlet weak var GREScore: UITextField!
    @IBOutlet weak var tofelScore: UITextField!
    @IBOutlet weak var universityRating: UITextField!
    @IBOutlet weak var SOP: UITextField!
    @IBOutlet weak var LOR: UITextField!
    @IBOutlet weak var CGPA: UITextField!
    @IBOutlet weak var research: UITextField!
    @IBOutlet weak var chances: UILabel!
    
    @IBAction func buttonPredict(){
        predictAdmission()
        
    }
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func predictAdmission(){
        let queue = DispatchQueue(label: "update")
        
        var gre = GREScore.text!
        var tofel = tofelScore.text!
        var uniRating = universityRating.text!
        var sop = SOP.text!
        var lor = LOR.text!
        var cgpa = CGPA.text!
        var re = research.text!
      
        let url = URL(string: "http://127.0.0.1:8000/firstpage/" + cgpa + "/" + uniRating + "/" + gre + "/" + tofel + "/" + sop + "/" + lor + "/" + re)!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            self.name = String(data: data, encoding: .utf8)!
            print(String(data: data, encoding: .utf8)!)
            print(String(self.name))
            
            DispatchQueue.main.async {
                self.chances.text = self.name
            }
        
        }
            
     
        

        task.resume()
        
        
    
    }


}

