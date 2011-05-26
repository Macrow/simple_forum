class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    unless Role.all.collect(&:name).include?("guest")
      @role_guest = Role.creat!(:name => "guest")
    else
      @role_guest = Role.find_by_name("guest")
    end
    resource.roles << @role_guest
    root_path
  end
end

