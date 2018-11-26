When("introduzco las coordenadas {string}, {string} y {string} de la jugada") do |x, y, direccion|
    fill_in(x, with: "2")
    fill_in(y, with: "2")
    select('Arriba', from: direccion)
end
  
Then("se debe seguir en la misma pagina de {string} con el tablero actualizado.") do |string|
    expect(page).to have_content "Juego"
end
      

Then("deberia poder ingresar la columna de mi jugada en el campo {string}") do |x|
    find_field(x).value 
    fill_in(x, with: "2")  
    expect(page).to have_selector('input',id:x)

end
  
Then("deberia poder ingresar la fila de mi jugada en el campo {string}") do |y|
    find_field(y).value 
    fill_in(y, with: "2")  
    expect(page).to have_selector('input',id:y)

end
  
  Then("deberia poder ingresar la direccion de mi jugada en el campo {string}") do |direccion|
    find_field(direccion).value 
    select('Arriba', from: direccion)
    expect(page).to have_selector('select',id:direccion)
  end
  
  
  