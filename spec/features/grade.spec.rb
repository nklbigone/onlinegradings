require 'rails_helper'

RSpec.feature "Users management", type: :feature do
    background do 
        User.create(first_name: 'Ndikumana',
                    last_name: 'Alexis',
                    national_id: '133',
                    address: 'Kigali',
                    level: '6',
                    classes: '2',
                    email: 'nklbigone@gmail.com',
                    password: 'alexis')
                    @user = User.first
                    visit new_user_session_path
                    fill_in 'Email', with: 'nklbigone@gmail.com'
                    fill_in 'Password', with: 'alexis'
                    click_button 'Log in'
    end
    scenario "Test successful Course registration" do
        Course.create!(course_name: 'Math', course_code: 'mth101', user_id: @user.id)
        @course = Course.first
        @grade = Grade.create(mark: '39', user_id: @user.id, course_id: @course.id)
        expect(@grade).to be_valid 
    end
end