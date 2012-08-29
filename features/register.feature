Feature: Registers

    Scenario: A user can create a register
        Given I visit the new register page
        And I fill in the new register form
        And I press save
        And I see a success message and the information of the register
