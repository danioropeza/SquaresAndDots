Given("visito la pagina principal") do
    visit('/') 
end

Then("deberia ver el nombre del juego {string}") do |mensaje|
    expect(page).to have_content(mensaje)
end

Then("deberia ver el logo del juego {string}") do |imagen|
    expect(page.find('#' + imagen)['name']).to have_content imagen
end

When("presiono el boton {string}") do |nombreBoton|
    click_button(nombreBoton)
end

Then("deberia ver la pagina de configurar partida con el titulo {string}") do |titulo|
    expect(page).to have_content(titulo)
end