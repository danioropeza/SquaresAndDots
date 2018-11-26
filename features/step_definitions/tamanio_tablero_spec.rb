Given("visito la dimension tablero") do
    visit('/dimension') 
end

When("ingreso los la dimension en el campo {string}") do |dimension|
    fill_in(dimension, with: 5)  
end
  
Then("deberia poder ver el titulo {string}") do |titulo|
    expect(page).to have_content titulo
end