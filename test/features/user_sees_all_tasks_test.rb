require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest
#we defined feature test in test helper

  def test_user_sees_all_tasks
    task_manager.create({title: "Title1", description: "Description1"})
    task_manager.create({title: "Title2", description: "Description2"})

    visit '/tasks'
      #visit is a capybara method
# save_and_open_page
      #launch
    assert page.has_content?("Title1")
    assert page.has_content?("Title2")
  end

end
