
Then("el puntaje deberia ser {int}") do |puntaje|
   expect(page).to have_content(puntaje)
end