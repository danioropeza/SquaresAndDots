Given("visito la pagina jugar") do
    visit('/juego') 
end

Then("deberia mostrar el tablero {string}") do |string|
    expect(page).to have_table string
    
end

Then("deberia ver mi nombre de jugador {string}") do |nombre|
    expect(page).to have_content(nombre )
end
  