//
//  ViewController.swift
//  My iNotes
//
//  Created by Diego Zamora on 18/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Conexiones y Variables
    @IBOutlet weak var miTabla: UITableView!
    
    let myDefaultDB = UserDefaults.standard
    var misNotas = [Nota]()
    var indexNota: Int?
    var miNota: Nota?
    
    // MARK: - Overrides y Cosas de Protocolos
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /// Delegado Tabla
        miTabla.delegate = self
        miTabla.dataSource = self
        
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
    
    
    /// Protocolos de la Tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        /// Numero de Objetos in Array (array.count)
        return misNotas.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objCelda = miTabla.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        /// Los Datos de mi Celda (indexPath.row)
        objCelda.textLabel?.text = misNotas[indexPath.row].titulo
        objCelda.detailTextLabel?.text = misNotas[indexPath.row].fecha
                
        return objCelda
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "\(misNotas.count) Notes..."
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        indexNota = indexPath.row
        miNota = misNotas[indexPath.row]
        performSegue(withIdentifier: "Editar", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Editar"
        {
            let objEditar = segue.destination as! EditarViewController
            
            objEditar.miNota = miNota
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        miTabla.reloadData()
        print("pear")
        print(misNotas)
    }
}

