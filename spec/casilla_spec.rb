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
        expect(@casilla.color()).to eq "#ffffff"
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
        expect(@casilla.generarHTML()).to eq (" <td width='25px' height='25px' bgcolor='0000ff'></td> ")
    end

    it "Deberia casilla ser nula despues de reiniciarla" do
        @casilla.marcarDerecho()
        @casilla.reiniciarCasilla()
        expect(@casilla.esCasillaNula()).to eq true
    end
end