Given /^Time it is December (\d+)$/ do |arg1|
    Timecop.freeze(Time.new(2012,12,01))
end

Given /^I visit the new register page$/ do
    visit new_register_url
end

Given /^I fill in the register form$/ do
    fill_in "Fecha", with: "31-12-2012"
    fill_in "Concepto", with: "Registro"
    fill_in "Cantidad", with: "2000"
    fill_in "Id", with: "123"
    fill_in "Detalle", with: "Es un texto no mas..."
    fill_in "Tags", with: "palabra, muchas, separadas, por, coma"
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
    page.should have_content("palabra, muchas, separadas, por, coma")
end

Given /^I visit the registers page$/ do
    visit registers_url 
end

Given /^I see a list of registers$/ do
    page.should have_content("Diciembre")
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

Given /^Two registers exist from two months ago$/ do
    FactoryGirl.create(:register, :date => Date.today - 2.months)
    FactoryGirl.create(:register, :date => Date.today - 2.months)
end

Given /^I click the previous link twice$/ do
    click_link 'previous'
    click_link 'previous'
end

Given /^I see a list of registers from two months ago$/ do
    page.should have_content("01-10-2012")
end

Given /^One register from one month ago$/ do
    FactoryGirl.create(:register, :date => Date.today - 1.months)
end

Given /^I click the next link once$/ do
    click_link 'next'
end

Given /^I see a list of registers from one month ago$/ do
    page.should have_content("01-11-2012")
end

