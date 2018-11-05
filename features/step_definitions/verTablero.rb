Given("visito la pagina jugar") do
    visit('/juego') 
end

Then("deberia ver el tablero {string} del juego") do |tablero|
    expect(page.find('#' + tablero)['name']).to have_content tablero
end
