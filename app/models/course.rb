class Course < ApplicationRecord
    has_one :grade
    
    validates :course_name, presence:true
    validates :course_code, presence:true
    validates :user_id, presence:true
    paginates_per 3
end
