Feature: Duplicate a page
	As an author
	I want to duplicate a page in the CMS
	So that I can grow my website

	Background:
		Given I am logged in with "ADMIN" permissions
		Given a "page" "Page1"
		And the "page" "Page1a" is a child of the "page" "Page1"
		And the "page" "Page1b" is a child of the "page" "Page1"
		And the "page" "Page1b1" is a child of the "page" "Page1b"

	@javascript @retry
	Scenario: I can duplicate a page in the pages section
		When I go to "/admin/pages"
		And I right click on "Page1" in the tree
		And I hover on "Duplicate" in the context menu
		And I click on "This page and subpages" in the context menu
		Then I should see a "Duplicated 'Page1' and children successfully" success toast

		When I fill in "MenuTitle" with "Duplicate Page"
		And I press the "Publish" button
		Then I should see "Page1" in the tree
		And I should see "Duplicate Page" in the tree
		When I follow "Duplicate Page"
		Then I should see "Page1a"
		And I should see "Page1b"
