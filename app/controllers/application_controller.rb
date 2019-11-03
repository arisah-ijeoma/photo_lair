class ApplicationController < ActionController::Base
  layout :set_layout

  def after_sign_in_path_for(resource)
    photos_path(wardrobe: resource.id)
  end

  def after_sign_up_path_for(resource)
    photos_path(wardrobe: resource.id)
  end

  private

  def set_layout
    devise_controller? ? 'devise' : 'application'
  end
end
