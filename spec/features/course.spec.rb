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
        visit new_course_path
        fill_in 'Course name', with: 'Ruby'
        fill_in 'Course code', with: 'Ndiku'
        click_button '登録する'
        expect(page).to have_content 'Ruby'
    end
    scenario "Test successful Search course" do
        Course.create!(course_name: 'Math',
                        course_code: 'mth101', user_id: @user.id)
        visit courses_path
        fill_in 'Search course', with: 'Math'
        click_button '検索'
        expect(page).to have_content 'Math'
    end
    scenario "Test pagination" do
        Course.create!(course_name: 'Math', course_code: 'mth101', user_id: @user.id)
        Course.create!(course_name: 'Biology', course_code: 'bio101', user_id: @user.id)
        Course.create!(course_name: 'Physics', course_code: 'Phy090', user_id: @user.id)
        Course.create!(course_name: 'Math', course_code: 'mth101', user_id: @user.id)
        Course.create!(course_name: 'Math', course_code: 'mth101', user_id: @user.id)
        visit courses_path
        expect(page).to have_xpath("//*[@class='pagination']//a[text()='2']")
      end
end