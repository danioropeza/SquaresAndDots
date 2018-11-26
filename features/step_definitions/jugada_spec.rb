When("introduzco las coordenadas y direccion de la jugada") do
    fill_in("x", with: "2")
    fill_in("y", with: "2")
    select('Arriba', from: 'direccion')
end

Then("se debe mostrar el mismo titulo juego") do
    expect(page).to have_content "Juego"
end
