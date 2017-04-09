require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # copy from http://guides.rubyonrails.org/testing.html
  test "saves a new category" do
    category = Category.new(name: "Wages")
    assert category.save
  end

  test "should not save a category without name" do
    category = Category.new
    assert_not category.save
  end
end
