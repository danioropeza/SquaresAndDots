Given("visito la dimension tablero") do
    visit('/dimension') 
end
  
 Then("deberia poder ingresar el tamanio en el campo {string}") do |string|
    find_field(string).value 
    fill_in(string, with: 5)  
end