Given("visito la pagina configurar") do
    visit('/configurarPartida') 
end
  
Then("deberia ver una ventana con opciones para elegir la cantidad de jugadores llamada {string}") do |nombre|
    expect(page).to have_select(nombre)
end

Given("visito la pagina configurar y selecciono la opcion {string} jugadores de la ventana {string}") do |string, string2|    visit('/configurarPartida') 
    visit('/configurarPartida') 
    expect(page).to have_select(string2,selected:[string])
end
  
Then("deberia poder escribir en los campos {string} y {string}") do |string, string2|
    find_field(string,visible:false).value 
    find_field(string2,visible:false).value 
end
  

