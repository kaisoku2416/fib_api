require 'spec_helper'
require_relative '../rails_helper'
require 'capybara/rspec'
require 'faker'

RSpec.describe 'fibonacci_calc', type: :system do
  before do
    driven_by :selenium_chrome
  end
  it 'nが1<=n<1_000_000のとき' do
    visit "/fib?n=#{ rand(1...1_000_000) }"
    expect(page).to have_text('result')
  end
  it 'nが範囲以下のとき' do
    visit "/fib?n=-#{ rand(0...1_000_000) }"
    expect(page).to have_text('416')
  end
  it 'nが範囲以上のとき' do
    visit "/fib?n=#{ rand(1_000_000...1_000_000_000) }"
    expect(page).to have_text('416')
  end
  it 'nが数字ではないとき' do
    visit "/fib?n=#{ Faker::Name.unique.last_name }"
    expect(page).to have_text('400')
  end
end