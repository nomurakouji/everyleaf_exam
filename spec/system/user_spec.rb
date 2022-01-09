require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  describe '新規登録機能' do
    context 'ユーザーを新規登録した場合' do
      it '登録したユーザーが表示される' do
        visit new_user_path
        fill_in 'Namae', with: '田中太郎'
        fill_in 'Email', with: 'tanaka@taro.com'
        fill_in 'Password', with: 'tanaka@taro.com'
        fill_in 'Password confirmation', with: 'tanaka@taro.com'
        click_on 'Create my account'
        expect(page). to have_content '田中太郎'
        expect(page). to have_content 'tanaka@taro.com'
      end
    end
    context 'ユーザーがログインせずにタスク一覧画面に飛ぼうとした場合' do
      it 'ログイン画面に遷移される' do
        visit tasks_path
        expect(page). to have_content 'Sign up'
      end
    end
  end
  describe 'セッション機能' do
    before do
      FactoryBot.create(:user)
      # FactoryBot.create(:second_user)
      # FactoryBot.create(:third_user)
    end
    context 'ユーザーを新規登録した場合' do
      it 'ログインができる' do
        visit sessions_new_path
        fill_in 'Email', with: '管理者です'
        fill_in 'Password', with: 'admin@admin.com'
        click_on 'Log in'
      end
    end
  end
end