# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :name, presence: true

    belongs_to :enrollments,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :Enrollment

end
