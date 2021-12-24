require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
  FactoryBot.create(:task)
  FactoryBot.create(:second_task)
  visit tasks_path
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, name: 'task')
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        assert Task.all.order(created_at: "desc") 
      end
    end
  end
end