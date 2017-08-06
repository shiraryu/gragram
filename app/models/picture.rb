class Picture < ApplicationRecord
  validates:content,presence:true,length:{maximum: 350}

  belongs_to :user,optional: true
end
