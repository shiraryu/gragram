class Picture < ApplicationRecord
  validates:content,presence:true,length:{maximum: 350}
end
