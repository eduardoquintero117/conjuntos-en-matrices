import UIKit

// Problema : Tenemos una matriz compuesta por letras que si son iguales horizontalmente o verticalmente perteneces al mismo conjunto.Determinar el numero de conjuntos


// entrada
//var pict : [String] = ["aabba","aabba","aaacb"]
var pict : [String] = ["bbba","abba","acaa","aaab"]

//funcion
func numeroConjuntos(picture: [String] ) {
    
      //crea una nueva matriz con elementos character -----------------
        var matris = [[Character]]()
        matris = picture.map({$0.map({$0})})
        print(matris)
    
}
// salida
numeroConjuntos(picture: pict)
// para ["bbba","abba","acaa","aaab"] -> 4
