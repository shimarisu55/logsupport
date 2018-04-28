class RegistrationsController < Devise::RegistrationsController
 
 
  # POST /resource
  def create
    build_resource(sign_up_params)
 
    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
        
        #独自の処理を追加
        create_group(resource)
        
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end
  
  def create_group(resource)
     group = Group.new
     group.manage_id = current_user.id
     group.name = "非公開練習帳"
     group.descreption = "このグループを投稿先にした場合、記事はこのページにしか反映されません。練習帳として使いましょう。"
     group.secret = true
     group.save
     group_user = GroupUser.new
     group_user.user_id = current_user.id
     group_user.group_id = group.id
     group_user.save
  end

end