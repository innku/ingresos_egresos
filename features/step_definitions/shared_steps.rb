Given /^I see a success message, "(.*?)"$/ do |message|
  page.should have_content(message)
end


Given /^I press save$/ do
    click_button "Guardar"
end