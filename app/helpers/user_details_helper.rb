module UserDetailsHelper
  
  #
  # Use this to wrap view elements that the user_detail can't access.
  # !! Note: this is an *interface*, not *security* feature !!
  # You need to do all access control at the controller level.
  #
  # Example:
  # <%= if_authorized?(:index,   user_detail)  do link_to('List all users', users_path) end %> |
  # <%= if_authorized?(:edit,    @user_detail) do link_to('Edit this user_detail', edit_user_detail_path) end %> |
  # <%= if_authorized?(:destroy, @user_detail) do link_to 'Destroy', @user_detail, :confirm => 'Are you sure?', :method => :delete end %>
  #
  #
  def if_authorized?(action, resource, &block)
    if authorized?(action, resource)
      yield action, resource
    end
  end

  #
  # Link to user_detail's page ('users/1')
  #
  # By default, their login is used as link text and link title (tooltip)
  #
  # Takes options
  # * :content_text => 'Content text in place of user_detail.login', escaped with
  #   the standard h() function.
  # * :content_method => :user_detail_instance_method_to_call_for_content_text
  # * :title_method => :user_detail_instance_method_to_call_for_title_attribute
  # * as well as link_to()'s standard options
  #
  # Examples:
  #   link_to_user @user_detail
  #   # => <a href="/user_details/3" title="barmy">barmy</a>
  #
  #   # if you've added a .name attribute:
  #  content_tag :span, :class => :vcard do
  #    (link_to_user_detail user_detail, :class => 'fn n', :title_method => :login, :content_method => :name) +
  #          ': ' + (content_tag :span, user_detail.email, :class => 'email')
  #   end
  #   # => <span class="vcard"><a href="/user_details/3" title="barmy" class="fn n">Cyril Fotheringay-Phipps</a>: <span class="email">barmy@blandings.com</span></span>
  #
  #   link_to_user @user_detail, :content_text => 'Your user_detail page'
  #   # => <a href="/user_details/3" title="barmy" class="nickname">Your user_detail page</a>
  #
  def link_to_user_detail(user_detail, options={})
    raise "Invalid user_detail" unless user_detail
    options.reverse_merge! :content_method => :login, :title_method => :login, :class => :nickname
    content_text      = options.delete(:content_text)
    content_text    ||= user_detail.send(options.delete(:content_method))
    options[:title] ||= user_detail.send(options.delete(:title_method))
    link_to h(content_text), user_detail_path(user_detail), options
  end

  #
  # Link to login page using remote ip address as link content
  #
  # The :title (and thus, tooltip) is set to the IP address 
  #
  # Examples:
  #   link_to_login_with_IP
  #   # => <a href="/login" title="169.69.69.69">169.69.69.69</a>
  #
  #   link_to_login_with_IP :content_text => 'not signed in'
  #   # => <a href="/login" title="169.69.69.69">not signed in</a>
  #
  def link_to_login_with_IP content_text=nil, options={}
    ip_addr           = request.remote_ip
    content_text    ||= ip_addr
    options.reverse_merge! :title => ip_addr
    if tag = options.delete(:tag)
      content_tag tag, h(content_text), options
    else
      link_to h(content_text), login_path, options
    end
  end

  #
  # Link to the current user_detail's page (using link_to_user) or to the login page
  # (using link_to_login_with_IP).
  #
  def link_to_current_user_detail(options={})
    if current_user
      link_to_user_detail current_user, options
    else
      content_text = options.delete(:content_text) || 'not signed in'
      # kill ignored options from link_to_user
      [:content_method, :title_method].each{|opt| options.delete(opt)} 
      link_to_login_with_IP content_text, options
    end
  end

end
