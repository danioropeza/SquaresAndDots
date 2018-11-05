Given("visito la pagina configurar y  lleno la imformacion del jugador") do

  visit('/configurarPartida') 
end
  
  Then("deberia poder ingresar mi nombre en el campo {string}") do |string|
    find_field(string,visible:false).value 
  end

  Then("deberia poder seleccionar un color en el campo {string}") do |string|
    find_field(string,visible:false).value 
  end
  
  Then("deberia ver la pagina con el titulo {string}") do |titulo|
    expect(page).to have_content(titulo)
  end

  When("presiono el boton de {string}") do |nombreBoton|
    click_button(nombreBoton,visible:false)

  end