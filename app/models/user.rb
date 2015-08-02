class User < ActiveRecord::Base
  validates_uniqueness_of :login, message: "Такой логин уже существует в системе!"

  def admin?
    role == 'admin'
  end
end
