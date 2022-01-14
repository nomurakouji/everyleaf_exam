require 'rails_helper'
RSpec.describe 'ラペリング機能', type: :system do
  describe 'タスクの作成' do
    before do
        FactoryBot.create(:user)
        visit sessions_new_path
        fill_in 'session[email]', with: 'admin@admin.com'
        fill_in 'session[password]', with: 'admin@admin.com'
        click_on 'Log in'
    end
    it '複数のラベルがつけられる(=タスクを新規登録する時タスクと一緒にラベルを登録できる)' do       
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
    context 'タスクの詳細画面' do
      it 'タスクに紐づいているラベル一覧を出力する' do
        click_on 'task_all'
        click_on '新規作成'
        fill_in "task_name" , with: "breakfast"
        fill_in "task_content" , with: "breakfast"
        fill_in "task_deadline" , with: "2023/2/1"
        fill_in "task[label]" , with: "food,happy"
        click_on '登録する'
        click_on '確認'
        expect(page).to have_content 'food'
        expect(page).to have_content 'happy'
      end    
    end
    it 'つけたラベルで検索できる' do
      click_on 'task_all'
      click_on '新規作成'
      fill_in "task_name" , with: "breakfast"
      fill_in "task_content" , with: "breakfast"
      fill_in "task_deadline" , with: "2023/2/1"
      fill_in "task[label]" , with: "food,happy"
      click_on '登録する'
      click_on '新規作成'
      fill_in "task_name" , with: "lunch"
      fill_in "task_content" , with: "lunch"
      fill_in "task_deadline" , with: "2023/2/1"
      fill_in "task[label]" , with: "food"
      click_on '登録する'
      test_link = find(:xpath, '/html/body/table/tbody/tr[1]/td[8]/a')
      test_link.click
      click_on 'food'
      expect(page).to have_content 'breakfast'
      expect(page).to have_content 'lunch'
    end
  end
end




