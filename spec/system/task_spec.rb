require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
        it '作成したタスクが表示される' do
            visit new_task_path
            fill_in "task[title]", with:"test"
            fill_in "task[content]", with:"test"
            find(:xpath, '/html/body/form/div[3]/input').click
            expect(page).to have_content 'test'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        FactoryBot.create(:task, title: 'test1', content: 'test2')
        visit tasks_path
        # binding.irb
        expect(page).to have_content 'test1'
        expect(page).to have_content 'test2'
      end
    end
    # テスト内容を追加で記載する
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        # ここに実装する
        FactoryBot.create(:task, title: 'test1')
        FactoryBot.create(:task, title: 'test2')
        FactoryBot.create(:task, title: 'test3')
        visit tasks_path
        # binding.irb
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'test3'
        expect(task_list[1]).to have_content 'test2'
        expect(task_list[2]).to have_content 'test1'
      end
    end
  end  
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        task = FactoryBot.create(:task, title: 'test', content: 'test')
        visit task_path(task)
        expect(page).to have_content 'test'
      end
    end
  end
end