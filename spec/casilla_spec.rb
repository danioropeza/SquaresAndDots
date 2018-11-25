require "./lib/casilla"
describe Casilla do
    before (:each) do
        @casilla=Casilla.new()
    end

    it "Deberia ser una casilla nula cuando se la crea" do
        expect(@casilla.esCasillaNula()).to eq true
    end

    it "Deberian estar todos los lados de la casilla no pintados, es decir en 'false' cuando se la crea" do
        expect(@casilla.izquierdo()).to eq false
        expect(@casilla.derecho()).to eq false
        expect(@casilla.superior()).to eq false
        expect(@casilla.inferior()).to eq false
    end

    it "Deberia devolver el color blanco '#ffffff' al crear una nueva casilla" do
        expect(@casilla.color()).to eq "white"
    end
    
    it "Deberia devolver el color azul '#0000ff' al pintar esa casilla" do
        @casilla.pintar("#0000ff")
        expect(@casilla.color()).to eq "#0000ff"
    end

    it "No deberia pintar una casilla de color verde '#00ff00' cuando ya se la haya pintado diferente de blanco '0000ff'" do
        @casilla.pintar("#0000ff")
        @casilla.pintar("#00ff00")
        expect(@casilla.color()).to eq "#0000ff"
    end

    it "Deberia devolver izquierdo igual a 'true' cuando se dibuje una linea en este lado de la casilla" do
        @casilla.marcarIzquierdo()
        expect(@casilla.izquierdo()).to eq true
    end

    it "Deberia devolver derecho igual a 'true' cuando se dibuje una linea en este lado de la casilla" do
        @casilla.marcarDerecho()
        expect(@casilla.derecho()).to eq true
    end

    it "Deberia devolver superior igual a 'true' cuando se dibuje una linea en este lado de la casilla" do
        @casilla.marcarSuperior()
        expect(@casilla.superior()).to eq true
    end

    it "Deberia devolver inferior igual a 'true' cuando se dibuje una linea en este lado de la casilla" do
        @casilla.marcarInferior()
        expect(@casilla.inferior()).to eq true
    end

    it "Deberia una casilla estar pintada cuando todos sus lados esten marcados" do
        @casilla.marcarInferior()
        @casilla.marcarSuperior()
        @casilla.marcarDerecho()
        @casilla.marcarIzquierdo()
        expect(@casilla.esCasillaPintada()) == true
    end

    it "Deberia generar el html ' <td width='25px' height='25px' bgcolor='0000ff'></td> ' si la casilla tiene el color '0000ff'" do
        @casilla.pintar("0000ff")
        expect(@casilla.generarHTMLCasilla()).to eq (" <td width='25px' height='25px' bgcolor='0000ff'></td> ")
    end

    it "Deberia casilla ser nula despues de reiniciarla" do
        @casilla.marcarDerecho()
        @casilla.reiniciarCasilla()
        expect(@casilla.esCasillaNula()).to eq true
    end

    it "Deberia devolver el siguiente codigo cuando hago una jugada con linea horizontal " do 
        expect(@casilla.casillaLineaHorizontal()).to eq " <td><img src='images/lineaHorizontal.jpg'/></td> "
    end

    it "Deberia devolver el siguiente codigo cuando hago una jugada con linea vertical" do
        expect(@casilla.casillaLineaVertical()).to eq " <td><img src='images/lineaVertical.jpg'/></td> "
    end
    it "Deberia devolver el siguiente codigo para visualizar los puntos del tablero" do
        expect(@casilla.casillaPunto()).to eq " <td><img src='images/punto.jpg'/></td> "
    end
    it "Deberia devolver el siguiente codigo para visualizar las casillas vacias" do
        expect(@casilla.casillaEnBlanco()).to eq " <td width='25px' height='25px' bgcolor='white'></td> "
    end
    
    it "Deberia devolver un punto y espacio en blanco cuando la parte superior de la casilla no este marcada" do
        expect(@casilla.generarLadoSuperiorFilaPuntos()).to eq (@casilla.casillaPunto() + @casilla.casillaEnBlanco())
    end

    it "Deberia devolver  un punto y linea horizontal cuando la parte superior de la casilla este marcada" do
        @casilla.marcarSuperior()
        expect(@casilla.generarLadoSuperiorFilaPuntos()).to eq (@casilla.casillaPunto()+@casilla.casillaLineaHorizontal())
    end

    it "Deberia devolver dos espacios en blanco cuando la parte izquierda de la casilla no este marcada ni pintada" do
        expect(@casilla.generarCasillaPintadaYLadoIzquierdo()).to eq (@casilla.casillaEnBlanco()+@casilla.casillaEnBlanco())
    end

    it "Deberia devolver espacio en blanco y la casilla pintada de color '#0000ff' cuando la parte izquierda de la casilla este marcada y la casilla entera pintada." do
        @casilla.pintar("#0000ff")
        @casilla.marcarIzquierdo()
        expect(@casilla.generarCasillaPintadaYLadoIzquierdo).to eq (@casilla.casillaLineaVertical()+@casilla.generarHTMLCasilla())
    end

    it "Deberia devolver un punto y espacio en blanco cuando la parte inferior de la casilla no este marcada" do
        expect(@casilla.generarLadoInferiorFilaPuntos()).to eq (@casilla.casillaPunto()+@casilla.casillaEnBlanco())
    end

    it "Deberia devolver un punto y linea horizontal cuando la parte inferior de la casilla este marcada" do
        @casilla.marcarInferior()
        expect(@casilla.generarLadoInferiorFilaPuntos()).to eq (@casilla.casillaPunto()+@casilla.casillaLineaHorizontal())
    end

    it "Deberia devolver un punto y espacio en blanco cuando la parte derecha de la casilla no este marcada" do
        expect(@casilla.generarFinDeFilas("", "", "")).to eq (@casilla.casillaPunto() + "  </tr> " + @casilla.casillaEnBlanco() + "  </tr> ")
    end

    it "Deberia devolver un punto y linea vertical cuando la parte derecha de la casilla este marcada" do
        @casilla.marcarDerecho()
        expect(@casilla.generarFinDeFilas("", "", "")).to eq (@casilla.casillaPunto() + "  </tr> " + @casilla.casillaLineaVertical() + "  </tr> ")
    end
end