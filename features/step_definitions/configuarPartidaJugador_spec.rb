Given("visito la pagina configurar partida jugador") do

  visit('/configurarJugador') 
end
  
  Then("deberia poder ingresar mi nombre en el campo {string}") do |string|
    find_field(string).value 
  end

  Then("deberia poder seleccionar un color en el campo {string}") do |string|
    find_field(string).value 
  end
  
  Then("deberia ver la pagina con el titulo {string}") do |titulo|
    expect(page).to have_content(titulo)
  end