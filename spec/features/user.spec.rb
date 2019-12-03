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
    end
    scenario "Test successful user registration" do
        visit new_user_session_path
        click_link('Sign up', match: :first)
        fill_in 'First name', with: 'Alexis'
        fill_in 'Last name', with: 'Ndiku'
        fill_in 'National', with: '1234'
        fill_in 'Address', with: 'Kigali'
        fill_in 'Level', with: 2
        fill_in 'Classes', with: 5
        fill_in 'Email', with: 'nklbige@gmail.com'
        fill_in 'Password', with: 'nkflkgbf'
        fill_in 'Password confirmation', with: 'nkflkgbf'
        click_button 'Sign up'
        expect(page).to have_content 'アカウントの作成が完了しました。Mastodonへようこそ。'
    end

    scenario 'login' do
        visit new_user_session_path
        fill_in 'Email', with: 'nklbigone@gmail.com'
        fill_in 'Password', with: 'alexis'
        click_button 'Log in'
        expect(page).to have_content 'ログインしました。'
    end

end