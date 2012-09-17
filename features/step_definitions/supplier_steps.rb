Given /^I visit the new supplier page$/ do
  visit new_supplier_url
end

Given /^I fill in the supplier form$/ do
  fill_in "Nombre", with: "Ramon Z."
  fill_in "RFC", with: "RZMSAF08"
end

Given /^I see the information of the supplier$/ do
  page.should have_content("Ramon Z.")
  page.should have_content("RZMSAF08")
end