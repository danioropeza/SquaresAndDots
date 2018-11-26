Then("deberia ver mi nombre {string}") do |nombre|
    expect(page).to have_content nombre
end

Then("deberia ver mi nombre pintado de color {string}") do |color|
    expect(page.find('#nombre')['style']).to have_content ("color: " + color)
    # <p id="nombre" name="nombre" class="form-control-static" style='color: <%= @colorJugador2 %>;' */><%= @nombre2 %><p/>
end