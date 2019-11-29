class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :course_code
      t.string :user_id
      t.timestamps
    end
  end
end
