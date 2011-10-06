require 'test_helper'

class Admin::DocumentsControllerTest < ActionController::TestCase
  context "Listing documents" do
    setup do
      login
      @doc = Factory.create(:pdf)
      get :list
    end

    should_respond_with :success

    context "and editing" do
      setup do
        get :edit, :id => @doc.id
      end

      should_respond_with :success
    end

  end
end
