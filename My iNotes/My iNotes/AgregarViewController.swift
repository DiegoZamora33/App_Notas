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
    
    var myDatabase = UserDatabase()
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
        
        let accionCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        
        alerta.addAction(accion)
        alerta.addAction(accionCancelar)

        
        alerta.addTextField{
            (textField) in textField.placeholder = "Titulo..."
            miTextField = textField
        }
        
        present(alerta, animated: true, completion: nil)
        
    }
    
    
    // MARK: - Overries, Protocolos y Delegados
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        text!.layer.borderWidth = 1
        text!.layer.borderColor = #colorLiteral(red: 0.983659327, green: 0.6143964529, blue: 0.9911581874, alpha: 0.7249186939)
        
        /// Consultar DB
        misNotas = myDatabase.getAllObjects()

    }
}
