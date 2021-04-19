//
//  Nota.swift
//  My iNotes
//
//  Created by Diego Zamora on 18/04/21.
//

import Foundation

class Nota: Codable {
    var titulo: String
    var texto: String
    var fecha: String

    init(titulo: String, texto: String, fecha: String) {
        self.titulo = titulo
        self.texto = texto
        self.fecha = fecha
    }
} 
