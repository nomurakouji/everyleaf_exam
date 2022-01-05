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
    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        select '未着手', from: 'condition'
        click_on 'search'
        expect(page).to have_content '未着手'
      end
    end
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it '検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる' do
        fill_in "name" , with: "1"
        select '未着手', from: 'condition'
        click_on 'search'
        expect(page).to have_content '1'
        expect(page).to have_content '未着手'
      end
    end
  end
end