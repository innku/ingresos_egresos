Feature: Registers

    Scenario: A user can create a register
        Given I visit the new register page
        And I fill in the register form
        And I press save
        And I see a success message
        And the information of the register

    Scenario: A user can edit a register
        Given An existing register
        And I visit the edit register page for the register
        And I fill in the register form
        And I press save
        And I see a updated successfully message
        And the information of the register

    Scenario: A user can see a list of registers
        Given An income and an egress register exist
        And I visit the registers page
        And I see a list of registers