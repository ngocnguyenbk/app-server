class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :categories

  include Pagy::Backend

  def categories
    @categories ||= Category.all.preload(:sub_categories)
  end
end
