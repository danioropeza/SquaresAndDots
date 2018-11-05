var numero=1
function mostrarMensaje(){
    var cantidad=document.getElementById('Cantidadjugadores').value
    document.getElementById('jugadores').innerHTML= "Partida de " +cantidad+" jugadores"
    document.getElementById('jugador1').style.display='inline'
    document.getElementById('cantidad').style.display='none'
}

function jugadores(){
    var cantidad=document.getElementById('Cantidadjugadores').value
    if(numero<cantidad){                
        document.getElementById("jugador" + numero+"").style.display='none'
        numero++
        document.getElementById("jugador" + numero+"").style.display='inline'
    }
    else
    {
    document.getElementById('Confirmar').style.display='inline'

    }



}