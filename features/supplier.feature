Feature: Supplier
  Scenario: A user can create a new supplier
    Given I visit the new supplier page
    And I fill in the supplier form
    And I press save
    And I see a success message, "El proveedor fue creado exitosamente"
    And I see the information of the supplier