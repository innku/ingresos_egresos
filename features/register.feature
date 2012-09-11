Feature: Registers
    Background: 
        Given Time it is December 2012

    Scenario: A user can create a register
        Given I visit the new register page
        And I fill in the register form
        And I press save
        And I see a success message, "El registro fue creado exitosamente"
        And the information of the register

    Scenario: A user can edit a register
        Given An existing register
        And I visit the edit register page for the register
        And I fill in the register form
        And I press save
        And I see a updated successfully message
        And the information of the register

    Scenario: A user can see a list of registers
        Given Two incomes and two expenses exist
        And I visit the registers page
        And I see a list of registers
        And I see the total of incomes, expenses and difference

    Scenario: A user can see registers from previous months
        Given Two registers exist from two months ago
        And One register from one month ago
        And I visit the registers page
        And I click the previous link twice
        And I see a list of registers from two months ago
        And I click the next link once
        And I see a list of registers from one month ago

    Scenario: A user can filter the registers list by range of dates
        Given I visit the registers page
        And Two registers created in the range dates provided and one out of the range
        And I set an start date and a finish date
        And I click the search button 
        Then I see a filtered list of registers by the dates provided



