class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    user = User.where(github_login: auth['extra']['raw_info']['login']).first_or_initialize
    user.provider = auth['provider']
    user.uid = auth['uid']
    if auth['info']
       user.name = auth['info']['name']
       user.email = auth['info']['email']
       user.avatar = auth['info']['image']
       user.github_token = auth['credentials']['token']
       user.github_login = auth['extra']['raw_info']['login']
    end
    user.save!
    return user
  end

  def update_omniauth(auth)
    if auth['info']
       self.name = auth['info']['name']
       self.email = auth['info']['email']
       self.avatar = auth['info']['image']
       self.github_token = auth['credentials']['token']
       self.github_login = auth['extra']['raw_info']['login']
    end
    save!
  end

end
