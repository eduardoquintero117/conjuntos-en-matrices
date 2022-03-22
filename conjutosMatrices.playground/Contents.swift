import UIKit

// Problema : Tenemos una matriz compuesta por letras que si son iguales horizontalmente o verticalmente perteneces al mismo conjunto.Determinar el numero de conjuntos


// entrada
//var pict : [String] = ["aabba","aabba","aaacb"]
//var pict : [String] = ["bbba","abba","acaa","aaab"]
//var pict : [String] = ["abbc","bbbc","acac","ccba"]
var pict : [String] = ["aaab","bbba","aabc","bcab"]

//funcion
func numeroConjuntos(picture: [String] ) {
    
      //crea una nueva matriz con elementos character -----------------
        var matris = [[Character]]()
        matris = picture.map({$0.map({$0})})
        print(matris)
    
    // variables para nuevos conjuntos-----------------------------
        var cont = 0
        var r = 0
        var c = 0
        var vector = [(r,c)]
        var cambio = [(Int,Int)]()
        var cambio2 = [(Int,Int)]()
        var color = [[(Int,Int)]]()
        var total = matris.count * matris[0].count
        var colorTotal = 0
        var state = true
    
    
    while state {
            
            if(colorTotal > total){state = false}
            
            
            colorTotal = 0
            r = vector[cont].0
            c = vector[cont].1
            
            //.-
            if  c < matris[r].count - 1 {
                if matris[r][c] == matris[r][c+1] {
                    var bool = true
                    for i in vector{
                        if i == (r,c+1){bool = false}
                    }
                    if bool {vector.append((r,c+1))}
                    
                }else{
                    //print("NO \((r,c+1))")
                    cambio.append((r,c+1))
                }
                
                
            }
            
            //.-
            
            //-------------------------atras1
            if ( c > 0) {
                //.-
                
                if matris[r][c] == matris[r][c-1] {
                    var bool = true
                    for i in vector{
                        if i == (r,c-1){bool = false}
                    }
                    if bool {vector.append((r,c-1))}
                    
                }else{
                    //print("NO \((r,c+1))")
                    cambio.append((r,c-1))
                }
                
                
                
                
                //.-
            }
            //-------------------------atras2
            
            //------------------ arriba 1
            
            if ( r > 0) {
                if (matris[r][c] == matris[r-1][c] ){
                    var bool = true
                    for i in vector{
                        if i == (r-1,c){bool = false}
                    }
                    if bool { vector.append((r-1,c))}
                    
                }else{
                    //print("NOp \((r+1,c))")
                    cambio.append((r-1,c))
                }
                
                
            }
            
            
            
            
            //---------------- arriba 2
            //.-.-
            if ( r < matris.count - 1) {
                if (matris[r][c] == matris[r+1][c] ){
                    var bool = true
                    for i in vector{
                        if i == (r+1,c){bool = false}
                    }
                    if bool { vector.append((r+1,c))}
                    
                }else{
                    //print("NOp \((r+1,c))")
                    cambio.append((r+1,c))
                }
                
                
            }
            //.-.-
       
        
            cont = cont + 1
            
        
        
            if vector.count == cont {
               
                
                //elementos guardados para siguientes iteraciones--
                //print(color)
                //print("\(vector)------vector")
                //print("\(cambio)------cambio1")
                //print("\(cambio2)------cambio2")
                //----------------------------------
                
                color.append(vector)
                
                if(cambio.count == 0){state = false}
                vector.removeAll()
                
                //---- filtro-------------
                if (cambio2.count > 0 ){
                    
                    for col in color {
                        for i1 in col {
                            for i2 in cambio2  {
                                if i1 == i2 {vector.append(i1)}
                                
                            }
                            colorTotal += 1
                        }
                    }
                    //elemtos repetidos
                    //print(tempArray)
                    print(colorTotal)
                    for i in vector  {
                        cambio2 = cambio2.filter { $0 != i}
                    }
                    
                    //print("\(cambio2)------cambio2")
                    
                    colorTotal = 0
                    vector.removeAll()
                    
                    for col in color {
                        for i1 in col {
                            for i2 in cambio  {
                                if i1 == i2 {vector.append(i1)}
                                
                            }
                            colorTotal += 1
                        }
                    }
                    
                    print(colorTotal)
                    for i in vector  {
                        cambio = cambio.filter { $0 != i}
                    }
                    vector.removeAll()
                    //print("\(cambio)------cambio")
                    
                }
                
                
                
                
                //---- filtro-------------
                
                
                
                if(cambio.count > 0){
                    
                    cambio2 = cambio2 + cambio
                    vector.append(cambio2[0])
                    cambio2.remove(at: 0)
                    
                }
                
                if(cambio.count == 0 && cambio2.count > 0){
                    
                    
                    vector.append(cambio2[0])
                    cambio2.remove(at: 0)
                    
                }
                
                print(cambio2)
                cont = 0
                cambio.removeAll()
                print("parte 2")
                print("\(vector)------vector")
                if(vector.count ==  0){state = false}
                
            }
            
        
            
        }
    
        print("final-------------------")
        
        for b in 0...color.count - 1  {
            print(color[b])
        }
    print(color.count)
    
    
    
}
// salida
numeroConjuntos(picture: pict)
// para ["bbba","abba","acaa","aaab"] -> 4
