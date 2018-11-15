Given("visito la pagina primer jugador") do
   visit('/jugador1') 
  end
  
  Then("deberia poder ingresar mi nombre en el campo {string}") do |string|
    find_field(string).value 
    fill_in(string, with: 'John')
  end
  
  Then("deberia poder seleccionar un color en el campo {string}") do |string|
    find_field(string).value
    fill_in(string, with: '#FF0000')

  end
  
  When("introuduzco mis datos") do
    fill_in('nombre', with: 'John')
    fill_in('color', with: '#FF0000')

end
  
  When("presiono el boton  {string}") do |string|
    click_button(string)
  end
  
  Then("deberia ver la pagina con el titulo {string}") do |titulo|
    expect(page).to have_content(titulo)
  end