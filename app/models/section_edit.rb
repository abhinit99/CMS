class SectionEdit < ApplicationRecord

  belongs_to :admin_user
  belongs_to :section

  scope:sorted , lambda{order("position ASC")}
  
end
