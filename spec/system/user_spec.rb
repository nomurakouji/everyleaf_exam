require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  describe '新規登録機能' do
    context 'ユーザを新規登録した場合'do
      it '登録したユーザが表示される' do
        visit new_user_path
        fill_in 'Namae', with:'管理者です'
        fill_in 'Email', with: 'admin@admin.com'
        fill_in 'Password', with: 'admin@admin.com'
        fill_in 'Password confirmation', with: 'admin@admin.com'
        click_on 'Create my account'
        expect(page).to have_link 'Profile'
        expect(page).to have_link 'Logout'
        expect(page). to have_content '管理者です'
        expect(page). to have_content 'admin@admin.com'
      end
    end
    context 'ユーザがログインせずにタスク画面に飛んだ場合' do
      it 'ログイン画面に遷移' do
        visit tasks_path
        expect(page).to have_content 'Log in'
      end
    end
  end
  describe 'セッション機能' do
    before do
      FactoryBot.create(:second_user)
      visit new_user_path
      fill_in 'Namae', with:'user1'
      fill_in 'Email', with: 'user1@user.com'
      fill_in 'Password', with: 'user1@user.com'
      fill_in 'Password confirmation', with: 'user1@user.com'
      click_on 'Create my account'
    end
    context 'セッション機能' do
      it 'ログインできる' do
        expect(page).to have_link 'Profile'
        expect(page).to have_link 'Logout'
      end
    end
    context 'セッション機能' do
      it '自分の詳細画面に飛べる' do
        expect(page). to have_content 'user1'
        expect(page). to have_content 'user1@user.com'
      end
    end
    context '他人の詳細ページをクリック' do
      it 'タスク一覧画面に遷移する' do
        visit  user_path(2)
        expect(page).to have_content 'タスク一覧'
      end
    end
    context 'ログインする' do
      it 'ログアウトする' do
        click_on 'Logout'
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end
end










