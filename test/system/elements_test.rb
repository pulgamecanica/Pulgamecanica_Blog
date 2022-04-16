require "application_system_test_case"

class ElementsTest < ApplicationSystemTestCase
  setup do
    @element = elements(:one)
  end

  test "visiting the index" do
    visit elements_url
    assert_selector "h1", text: "Elements"
  end

  test "should create element" do
    visit elements_url
    click_on "New element"

    fill_in "Content", with: @element.content
    fill_in "Element type", with: @element.element_type
    fill_in "Position", with: @element.position
    fill_in "Post", with: @element.post_id
    click_on "Create Element"

    assert_text "Element was successfully created"
    click_on "Back"
  end

  test "should update Element" do
    visit element_url(@element)
    click_on "Edit this element", match: :first

    fill_in "Content", with: @element.content
    fill_in "Element type", with: @element.element_type
    fill_in "Position", with: @element.position
    fill_in "Post", with: @element.post_id
    click_on "Update Element"

    assert_text "Element was successfully updated"
    click_on "Back"
  end

  test "should destroy Element" do
    visit element_url(@element)
    click_on "Destroy this element", match: :first

    assert_text "Element was successfully destroyed"
  end
end
