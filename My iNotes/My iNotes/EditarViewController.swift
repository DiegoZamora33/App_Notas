//
//  EditarViewController.swift
//  My iNotes
//
//  Created by Diego Zamora on 18/04/21.
//

import UIKit

class EditarViewController: UIViewController {
    
    // MARK: - Conexiones y Variables Globales
    @IBOutlet weak var titulo: UITextField!
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var fecha: UILabel!
    
    var miNota: Nota?
    var indexNota: Int?
    
    var myDatabase = UserDatabase()
    var misNotas = [Nota]()
    
    // MARK: - Update Nota
    @IBAction func updateNota(_ sender: UIButton) {
        
        /// Elimianmos mi nota vieja
        misNotas.remove(at: indexNota!)
        
        /// Guardamos mi Nota
        let date = Date()
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        misNotas.append(Nota(titulo: titulo.text!, texto: text.text!, fecha: dateFormatter.string(from: date)))
        
        ///Guardado en UserDatabase
        if myDatabase.saveAllObjects(allObjects: misNotas)
        {
            print("Saved Succesfully")
        }
        else
        {
            print("Error Saving...")
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    

    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        text!.layer.borderWidth = 1
        text!.layer.borderColor = #colorLiteral(red: 0.983659327, green: 0.6143964529, blue: 0.9911581874, alpha: 0.7249186939)
        
        /// Cargamos la data de mi Nota en la Vista
        titulo.text = miNota?.titulo
        text.text = miNota?.texto
        fecha.text = miNota?.fecha
        
        /// Consultar DB
        misNotas = myDatabase.getAllObjects()
    }
    

}
