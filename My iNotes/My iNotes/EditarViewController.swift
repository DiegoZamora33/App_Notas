//
//  EditarViewController.swift
//  My iNotes
//
//  Created by Diego Zamora on 18/04/21.
//

import UIKit

class EditarViewController: UIViewController {
    
    // MARK: - Conexiones y Variables Globales
    @IBOutlet weak var text: UITextView!
    var miNota: Nota?
    var indexNota: Int?

    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        text!.layer.borderWidth = 1
        text!.layer.borderColor = UIColor.red.cgColor
    }
    

}
