require "application_system_test_case"

class PublishesTest < ApplicationSystemTestCase
  setup do
    @publish = publishes(:one)
  end

  test "visiting the index" do
    visit publishes_url
    assert_selector "h1", text: "Publishes"
  end

  test "should create publish" do
    visit publishes_url
    click_on "New publish"

    fill_in "Content", with: @publish.content
    fill_in "Title", with: @publish.title
    click_on "Create Publish"

    assert_text "Publish was successfully created"
    click_on "Back"
  end

  test "should update Publish" do
    visit publish_url(@publish)
    click_on "Edit this publish", match: :first

    fill_in "Content", with: @publish.content
    fill_in "Title", with: @publish.title
    click_on "Update Publish"

    assert_text "Publish was successfully updated"
    click_on "Back"
  end

  test "should destroy Publish" do
    visit publish_url(@publish)
    click_on "Destroy this publish", match: :first

    assert_text "Publish was successfully destroyed"
  end
end
