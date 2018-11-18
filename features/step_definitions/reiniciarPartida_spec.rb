Then("mi puntaje deberia ser {int}") do |puntaje|
    expect(page).to have_content(puntaje.to_s + "\r\n\r\nJohn" )
end