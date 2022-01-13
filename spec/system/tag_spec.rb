require 'rails_helper'
RSpec.describe 'ラペリング機能', type: :system do
  describe 'タスクの作成' do
    before do
        FactoryBot.create(:user)
    end
    it '複数のラベルがつけられる' do
        visit sessions_new_path
        fill_in 'session[email]', with: 'admin@admin.com'
        fill_in 'session[password]', with: 'admin@admin.com'
        click_on 'Log in'
        click_on 'task_all'
        click_on '新規作成'
        fill_in "task_name" , with: "breakfast"
        fill_in "task_content" , with: "breakfast"
        fill_in "task_deadline" , with: "2023/2/1"
        fill_in "task[label]" , with: "food,happy"
        click_on '登録する'
        expect(page).to have_content 'food'
        expect(page).to have_content 'happy'
    end
  end
end