require 'rails_helper'
RSpec.describe 'ユーザ登録、セッション機能、管理画面のテスト', type: :system do

  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user) { FactoryBot.create(:second_user) }

  describe 'ユーザー新規登録' do
    context 'ユーザーを新規作成した場合' do
      it 'ユーザの新規登録ができる' do
        visit new_user_path
        fill_in 'user[name]', with: 'ケイ'
        fill_in 'user[email]', with: 'naka_1@dic.com'
        fill_in 'user[password]', with: '111111'
        fill_in 'user[password_confirmation]', with: '111111'
        click_on '登録'
        expect(page).to have_content 'ケイ'
        expect(page).to have_content 'naka_1@dic.com'
      end
    end
  end
  context 'ログインせずタスク一覧画面に飛ぼうとした場合' do
    it 'ログイン画面に遷移する' do
      visit tasks_path
      expect(current_path).to eq new_session_path
    end
  end

  describe 'セッション機能テスト' do
    before do
      visit new_session_path
      fill_in 'session[email]', with: 'nakamura01@dic.com'
      fill_in 'session[password]', with: '111111'
      click_button 'ログイン'
    end
    context 'ログインした場合' do
      it 'マイページに遷移する' do
        expect(page).to have_content 'nakamura'
        expect(page).to have_content 'nakamura01@dic.com'
      end
    end
    context '他人の詳細画面に遷移した場合' do
      it 'タスク一覧画面に遷移する' do
        visit user_path(second_user)
        expect(current_path).to eq tasks_path
      end
    end
    context 'ログアウトをした場合' do
      it 'ログアウトしてログイン画面に遷移する' do
        visit user_path(user)
        click_on 'ログアウト'
        expect(current_path).to eq new_session_path
      end
    end
  end

  describe '管理画面のテスト' do
    before do
      visit new_session_path
      fill_in 'session[email]', with: 'nakamura01@dic.com'
      fill_in 'session[password]', with: '111111'
      click_button 'ログイン'
    end
    context '管理ユーザーが管理画面にアクセスした場合' do
      it '管理画面に遷移する' do
        visit tasks_path
        click_on 'ユーザー一覧'
        expect(current_path).to eq admin_users_path
      end
    end
    context '一般ユーザーが管理画面にアクセスした場合' do
      it '一般ユーザーは管理画面にアクセスできずタスク一覧画面に遷移する' do
        visit new_session_path
        fill_in 'session[email]', with: 'kei01@dic.com'
        fill_in 'session[password]', with: '222222'
        click_button 'ログイン'
        visit tasks_path
        click_on 'ユーザー一覧'
        expect(page).to have_content '管理者以外はアクセスできません'
      end
    end
    context '管理ユーザーがユーザー登録した場合' do
      it 'ユーザーの登録ができる' do
        visit tasks_path
        click_on 'ユーザー一覧'
        click_link 'ユーザー登録'
        fill_in 'user[name]', with: 'けい'
        select 'ユーザー', from: 'user[admin]'
        fill_in 'user[email]', with: '007_kei@dic.com'
        fill_in 'user[password]', with: '007kei'
        fill_in 'user[password_confirmation]', with: '007kei'
        click_on '登録する'
        expect(page).to have_content 'けい'
        expect(page).to have_content '007_kei@dic.com'
      end
    end
    context '管理ユーザーがユーザーの詳細にアクセスした場合' do
      it 'ユーザーの詳細画面に遷移できる' do
        visit admin_users_path
        click_button '詳細', match: :first
        expect(page).to have_content 'nakamuraさんのページ'
      end
    end
    context '管理ユーザーがユーザーの編集画面にアクセスした場合' do
      it 'ユーザーの編集ができる' do
        visit edit_admin_user_path(second_user)
        fill_in 'user[name]', with: '@けい@'
        select 'ユーザー', from: 'user[admin]'
        fill_in 'user[email]', with: '007_kei_007@dic.com'
        fill_in 'user[password]', with: '007kei'
        fill_in 'user[password_confirmation]', with: '007kei'
        # binding.pry
        click_on '更新する'
        expect(page).to have_content '@けい@'
        expect(page).to have_content '007_kei_007@dic.com'
      end
    end
    context '管理ユーザーがユーザーを削除した場合' do
      it 'ユーザーの削除ができる' do
        visit admin_users_path
        click_button '削除', match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '削除しました'
      end
    end
  end
end