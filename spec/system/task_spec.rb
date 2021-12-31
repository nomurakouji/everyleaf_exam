require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      FactoryBot.create(:task)
      FactoryBot.create(:second_task)
      FactoryBot.create(:third_task)
      visit tasks_path
    end
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        expect(page).to have_content 'タスク1'
        expect(page).to have_content 'コンテント1'
        expect(page).to have_content '2000/1/1'
        expect(page).to have_content '未着手'
        expect(page).to have_content 'タスク2'
        expect(page).to have_content 'コンテント2'
        expect(page).to have_content '2021/12/27'
        expect(page).to have_content '着手中'
      end
    end
    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        fill_in "name" , with: "1"
        click_on 'search'
        expect(page).to have_content '1'
      end
    end
    # context 'タスクが終了期限の降順で並んでいる場合' do
    #   it '最新の終了期限のタスクが一番上に表示される' do
    #     click_link "終了期限でソートする"
    #     get_deadline = all('.task_deadline')
    #     expect(get_deadline[0]).to have_content '2021/12/27'
    #     expect(get_deadline[1]).to have_content '2000/1/1'
    #     expect(get_deadline[2]).to have_content '1111/11/11'
    #   end
    # end
  end
end