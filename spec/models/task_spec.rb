require 'rails_helper'

RSpec.describe 'タスクモデル機能', type: :model do
  describe '検索機能' do
    let!(:task){ FactoryBot.create(:task)}
    let!(:second_task){ FactoryBot.create(:second_task)}
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        expect(Task.task_name_search('タスク1')).to include(task)
        expect(Task.task_name_search('タスク1')).not_to include(second_task)
        expect(Task.task_name_search('タスク1').count).to eq 1
      end
    end

    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.condition_search('未着手')).to include(task)
        expect(Task.condition_search('未着手')).not_to include(second_task)
        expect(Task.condition_search('未着手').count).to eq 1
      end
    end

    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.task_name_search('タスク1')).to include(task)
        expect(Task.condition_search('未着手')).to include(task)
        expect(Task.task_name_search('タスク1').count).to eq 1
      end
    end
  end
end