Given("visito la pagina resultado") do
    visit('/resultado')
end

Then("muestro mensaje {string} {string}") do |mensaje, ganador|
    expect(page).to have_content mensaje
    expect(page).to have_content ganador
end