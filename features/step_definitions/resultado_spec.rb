Given("visito la pagina resultado") do
    visit('/resultado')
end

Then("muestro mensaje {string}") do |mensaje|
    expect(page).to have_content mensaje
end