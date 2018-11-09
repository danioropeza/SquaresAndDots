require "./lib/tablero"

@tablero=Tablero.new()
@tablero.inicializar()
casillaPunto=" <td><img src='images/punto.jpg'/></td> "
        casillaEnBlanco=" <td width='25px' height='25px' bgcolor='white'></td> "
        numeroCasilla=1
        numeroFila=1
        filaPuntos="  <tr> "
        filaPintada="  <tr> "
        ultimaFila="  <tr> "
    
           
puts @tablero.generarHTMLTabla()
puts  filaPuntos=filaPuntos+casillaPunto