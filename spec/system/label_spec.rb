require 'rails_helper'
RSpec.describe 'ラベル機能', type: :system do

  let!(:user) { FactoryBot.create(:user) }
  # let!(:task) { FactoryBot.create(:task, user:user) }
  # let!(:second_task) { FactoryBot.create(:second_task, user:user) }
  # let!(:third_task) { FactoryBot.create(:third_task, user:user) }
  let!(:label) { FactoryBot.create(:label) }
  let!(:second_label) { FactoryBot.create(:second_label) }
  let!(:third_label) { FactoryBot.create(:third_label) }

  before do
    visit new_session_path
    fill_in 'session_email', with: 'nakamura01@dic.com'
    fill_in 'session_password', with: '111111'
    click_button 'ログイン'
  end  

  describe 'ラベル管理' do
    before do
      visit new_task_path
      fill_in "task[title]", with:"test"
      fill_in "task[content]", with:"test"
      fill_in "task[deadline]", with: DateTime.now
      select '未着手', from: 'task[status]'
      select '中', from: 'task[priority]'
      check 'ラベル１'
      check 'ラベル２'
      click_on '登録する'
    end
    context 'ラベルを選択してタスクを新規作成した場合' do
      it '作成したタスクに複数のラベルが表示される' do
        expect(page).to have_content 'ラベル１'
        expect(page).to have_content 'ラベル２'
      end
    end
    context 'タスクの詳細画面に遷移した場合' do
      it 'そのタスクに紐付いているラベルが出力される' do
        visit tasks_path
        click_link '詳細', match: :first
        expect(page).to have_content 'ラベル１'
      end
    end
    context 'タスクを編集した場合' do
      it 'タスクに紐付いているラベルも編集できる' do
        click_link '編集', match: :first
        fill_in "task[title]", with:"test"
        fill_in "task[content]", with:"test"
        fill_in "task[deadline]", with: DateTime.now
        select '着手中', from: 'task[status]'
        select '低', from: 'task[priority]'
        check 'ラベル３'
        click_on '更新する'
        expect(page).to have_content 'ラベル３'
      end
    end
    context 'ラベルを検索した場合' do
      it 'ラベルに一致するタスクが絞り込まれる' do
        visit tasks_path
        select 'ラベル１', from: 'task[label_id]'
        click_on '検索'
        expect(page).to have_content 'ラベル１'
      end
    end
  end
end
