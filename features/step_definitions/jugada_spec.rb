When("introduzco las coordenadas y direccion de la jugada") do
    fill_in("x", with: "2")
    fill_in("y", with: "2")
    select('Arriba', from: 'direccion')
end

Then("en el tablero debe mostrarse la nuevo jugada") do
    puts page.body
    # expect(page.find('#jugadorturno').value).to eq "jugadorturno"
end