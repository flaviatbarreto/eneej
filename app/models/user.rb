class User < ActiveRecord::Base
  
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  before_save :encrypt_password
  validates :password, :confirmation => true
    
  def self.authenticate name, password
    user=find_by_name(name)
    if(user && user.has_password?(password))     
     return user
    end
    nil 
  end
  
  def encrypt_password
    if(!has_password?(password))
      self.salt = make_salt 
    end
    self.encrypted_password = encrypt(password)
  end
  
  def encrypt(password)
    secure_hash("#{salt}info#{password}")
  end
  
  def has_password?(password)
    encrypt(password) == encrypted_password
  end
  
  def make_salt
    encrypt("#{Time.now.utc}info#{password}")
  end
  
  def secure_hash(password)
    Digest::SHA2.hexdigest(password)
  end
  


end

