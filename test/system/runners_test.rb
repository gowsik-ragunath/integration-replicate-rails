require "application_system_test_case"

class RunnersTest < ApplicationSystemTestCase
  setup do
    @runner = runners(:one)
  end

  test "visiting the index" do
    visit runners_url
    assert_selector "h1", text: "Runners"
  end

  test "should create runner" do
    visit runners_url
    click_on "New runner"

    click_on "Create Runner"

    assert_text "Runner was successfully created"
    click_on "Back"
  end

  test "should update Runner" do
    visit runner_url(@runner)
    click_on "Edit this runner", match: :first

    click_on "Update Runner"

    assert_text "Runner was successfully updated"
    click_on "Back"
  end

  test "should destroy Runner" do
    visit runner_url(@runner)
    click_on "Destroy this runner", match: :first

    assert_text "Runner was successfully destroyed"
  end
end
