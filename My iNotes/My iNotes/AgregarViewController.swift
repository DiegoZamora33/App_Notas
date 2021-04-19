//
//  AgregarViewController.swift
//  My iNotes
//
//  Created by Diego Zamora on 18/04/21.
//

import UIKit

class AgregarViewController: UIViewController {
    
    // MARK: - Conexiones y Variables Globales
    @IBOutlet weak var text: UITextView!
    
    let myDefaultDB = UserDefaults.standard
    var misNotas = [Nota]()
    
    
    
    // MARK: - Guardar Nota
    @IBAction func btnGuardar(_ sender: Any) {
        
        /// Guardamos mi Nota
        var miTextField = UITextField()
        
        let alerta = UIAlertController(title: "Se ha guardado una nueva nota!", message: "Se ha guardado una nueva nota!", preferredStyle: .alert)
        
        let accion = UIAlertAction(title: "OK", style: .default){ [self]
            (_) in
            
           
            let date = Date()
            let dateFormatter = DateFormatter()

            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short

            misNotas.append(Nota(titulo: miTextField.text!, texto: text.text!, fecha: dateFormatter.string(from: date)))
            
            myDefaultDB.set(misNotas, forKey: "notas")
            
            print(misNotas)
            
            navigationController?.popToRootViewController(animated: true)
        }
        
        let accionCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        
        alerta.addAction(accion)
        alerta.addAction(accionCancelar)

        
        alerta.addTextField{
            (textField) in textField.placeholder = "Titulo..."
            miTextField = textField
        }
        
        present(alerta, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        text!.layer.borderWidth = 1
        text!.layer.borderColor = UIColor.red.cgColor
        
        /// Consultar DB
        if myDefaultDB.array(forKey: "notas") != nil
        {
            misNotas = myDefaultDB.array(forKey: "notas") as! [Nota]
        }
        else
        {
            misNotas = []
        }
        
        print(misNotas)
    }


}
