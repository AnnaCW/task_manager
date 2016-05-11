require_relative '../test_helper'

class TaskManagetTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    task_manager.create({title: "TDD", description: "Learn to Test"})
    #we get task manager from test helper
    task = task_manager.find(1)
    assert_equal "TDD", task.title
    assert_equal "Learn to Test", task.description
    assert_equal 1, task.id
  end

  def test_it_finds_all_tasks
    task_manager.create({title: "TDD", description: "Learn to Test"})
    task_manager.create({title: "Update Profile", description: "With new info"})

    assert_equal 2, task_manager.all.count
    assert_equal "TDD", task_manager.all.first.title
  end

  def test_it_finds_a_single_task
    task_manager.create({title: "TDD", description: "Learn to Test"})
    task_manager.create({title: "Update Profile", description: "With new info"})

    assert_equal "TDD", task_manager.find(1).title
  end

  def test_it_updates_task
    task_manager.create({title: "TDD", description: "Learn to Test"})
    task_manager.update(1, {description: "Not learn to TDD"})

    assert_equal "Not learn to TDD", task_manager.find(1).description
  end

  def test_it_destroys_task
    task_manager.create({title: "TDD", description: "Learn to Test"})
    task_manager.create({title: "Update Profile", description: "With new info"})

    assert_equal 2, task_manager.all.count

    task_manager.destroy(2)

    assert_equal 1, task_manager.all.count
  end

end
