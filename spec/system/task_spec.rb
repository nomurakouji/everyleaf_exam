require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      before do
        Task.create!(name: 'taro', content:'aaa', deadline:'2021年12月1日')
      end
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task[name]', with: 'taro'
        fill_in 'task[content]', with: 'aaa'
        fill_in 'task[deadline]', with: '2021年12月1日'
        click_on '登録する'
        expect(page).to have_content 'taro'
        expect(page).to have_content 'aaa'
        expect(page).to have_content '2021年12月1日'
      end
    end
  end
end