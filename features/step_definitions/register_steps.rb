Given /^I visit the new register page$/ do
    visit new_register_url
end

Given /^I fill in the new register form$/ do
    fill_in "Fecha", with: "31-12-2012"
    fill_in "Concepto", with: "Registro"
    fill_in "Cantidad", with: "2000"
    fill_in "Id", with: "123"
    fill_in "Detalle", with: "Es un texto no mas..."
    choose "Ingreso"
end

Given /^I press save$/ do
    click_button "Guardar"
end

Given /^I see a success message and the information of the register$/ do
    page.should have_content("El registro fue creado exitosamente")
    page.should have_content("31-12-2012")
    page.should have_content("2000")
    page.should have_content("123")
    page.should have_content("Es un texto no mas...")
    page.should have_content("Ingreso")
end
