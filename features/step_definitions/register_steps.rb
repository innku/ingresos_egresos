Given /^I visit the new register page$/ do
    visit new_register_url
end

Given /^I fill in the register form$/ do
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

Given /^I see a success message$/ do
    page.should have_content("El registro fue creado exitosamente")

end

Given /^An existing register$/ do
    @register = FactoryGirl.create(:register)
end

Given /^I visit the edit register page for the register$/ do
    visit edit_register_url @register
end

Given /^I see a updated successfully message$/ do
    page.should have_content("El registro fue actualizado exitosamente")
end

Given /^the information of the register$/ do
    page.should have_content("31-12-2012")
    page.should have_content("2000")
    page.should have_content("123")
    page.should have_content("Es un texto no mas...")
    page.should have_content("Ingreso")
end

Given /^I visit the registers page$/ do
    visit registers_url 
end

Given /^I see a list of registers$/ do
    page.should have_content("31-12-2012")
    page.should have_content("Nuevo concepto")
    page.should have_content("-200")
    page.should have_content("200")
    page.should have_content("123")
end

Given /^An income and an egress register exist$/ do
    FactoryGirl.create(:register, :kind => 'egreso')
    FactoryGirl.create(:register)
end




