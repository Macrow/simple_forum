module ApplicationHelper
  def show_nav_path
    output = ""
    case controller_name
    when "home"
      output << "Home"
    when "sections"
      output << link_to("Home", root_path)
      output << " > "
      output << "Section"
    when "forums"
      output << link_to("Home", root_path)
      output << " > "
      if action_name == "show"
        output << @forum.title
      end
    when "topics"
      output << link_to("Home", root_path)
      output << " > "
      if action_name == "show"
        output << link_to(@topic.forum.title, @topic.forum)
        output << " > "
        output << @topic.title
      elsif action_name == "new" or action_name == "create"
        output << link_to(@topic.forum.title, @topic.forum)
        output << " > "
        output << "New Topic"
      end
    when "users"
      output << link_to("Home", root_path)
      output << " > "
      output << "Users"
    else
      output << link_to("Home", root_path)
      output << " > "
      output << controller_name.capitalize
    end
    raw output
  end

  def user_links
    output = ""
    if user_signed_in?
      output << "Welcome #{link_to current_user.user_name, edit_user_registration_path}"
      output << " | "
      output << link_to("Logout", destroy_user_session_path)
    else
      output << link_to("Login", new_user_session_path)
      output << " | "
      output << link_to("Register", new_user_registration_path)
    end
    raw output
  end

  def user_info(user)
    output = ""
    if user
      output << content_tag(:div, link_to(user.user_name, user), :class => "name")
      output << content_tag(:div, image_tag("user.gif"), :class => "avatar")
      output << content_tag(:div, "Group: #{user.roles.first.name}", :class => "group")
      output << content_tag(:div, "Register at: #{user.created_at.to_date}", :class => "register")
      output = content_tag(:div, raw(output), :class => "user_info")
    else
      output << "Deleted User"
    end
    raw output
  end

  def show_icon_by_post(post, icon_new, icon)
    output = ""
    title = "Open in a new window"
    image = icon
    if post && (Time.zone.now - post.updated_at) < 1.day
      image = icon_new
      title << " - New post"
    end
    output << image_tag(image, :border => 0, :title => title)
    raw output
  end
end

