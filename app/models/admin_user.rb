class AdminUser < ApplicationRecord


    has_secure_password

    has_and_belongs_to_many :pages
    has_many :section_edits

    has_many :sections, :through => :section_edits

    EMAIL_REGX= /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    # validates_presence_of :first_name
    # validates_length_of :first_name, :maximum =>25
    # validates_presence_of :last_name
    # validates_length_of :last_name, :maximum=>50
    # validates_presence_of :username
    # validates_length_of :username, :in=> 8..25
    # validates_uniqueness_of :username
    # validates_presence_of :email
    # validates_length_of :email, :maximum=>100
    # validates_format_of :email, :with=>EMAIL_REGX
    # validates_confirmation_of :email

    validates :first_name , :presence=>true,
                            :length=>{:maximum=>25}
    validates :last_name, :presence=>true,
                          :length=>{ :maximum=>50 }
    validates :username, :length=>{ :within=>8..25 },
                         :uniqueness=>true
    validates :email, :presence=>true,
                      :length=>{:maximum=>100},
                      :confirmation=>true,
                      :format=>EMAIL_REGX

    scope:sorted ,lambda{order("last_name ASC,first_name ASC")}

    def full_name
        [first_name,last_name].join(' ')
    end
end
