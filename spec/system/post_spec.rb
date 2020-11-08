require 'rails_helper'

describe 'コメント投稿機能', type: :system do
  describe '一覧表示機能' do
    
    before do
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      FactoryBot.create(:post, image: 'photo1.png', user: user_a)
    end

    context 'ユーザーAがログインしている時' do

      before do
        visit login_path
        fill_in 'email', with: 'a@example.com'
        fill_in 'password', with: 'password'
        click_button 'commit'
      end

      it 'ユーザーAの投稿が表示される' do
        expect(page).to have_content 'photo1.png'
      end
      
    end
  end
end