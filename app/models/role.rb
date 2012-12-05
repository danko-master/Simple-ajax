class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  
  #Добавил дабы добавить сиды
  #attr_accessible :name, :created_at, :updated_at
  
  scopify
end
