class User < ActiveRecord::Base
  rolify
  belongs_to :city
  belongs_to :area
  has_many :cars
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me, :password_confirmation,
    :name, :phone_number, :area_id, :city_id, :custom_city                                                                                                                                                                                                                                                                                                
  # attr_accessible :title, :body
  
  phone_number_regex = /^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/i
  
  #validates_presence_of :name
  #validates_uniqueness_of :name, :email, :case_sensitive => false
  
  validates :phone_number,
                #:presence => true,
                :format => {:with => phone_number_regex}, :allow_nil => true,
                :on => :update
  
end
