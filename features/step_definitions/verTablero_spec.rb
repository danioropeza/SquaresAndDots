Given("visito la pagina jugar") do
    visit('/juego') 
end

Then("deberia mostrar el tablero {string}") do |tablero|
    # expect(page).to have_table tablero
    # expect(page.find('#' + tablero)['name']).to have_content tablero
end

Then("deberia ver mi nombre de jugador {string}") do |nombre|
    expect(page).to have_content(nombre)
end
  