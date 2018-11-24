Given("visito la pagina jugar") do
    visit('/juego') 
end

Then("deberia mostrar el tablero {string}") do |string|
    expect(page).to have_css string
end

