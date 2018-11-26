Then("deberia ver mi nombre {string}") do |nombre|
    expect(page).to have_content nombre
end

Then("deberia ver mi puntaje actual {string}") do |puntaje|
    expect(page).to have_content puntaje
end
  