require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

before(:each) do
  Word.clear()
  Definition.clear()
end

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'apple')
    click_on('Go!')
    expect(page).to have_content('apple')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    word = Word.new("apple", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'a healthy fruit')
    click_on('Add definition')
    expect(page).to have_content('a healthy fruit')
  end
end

describe('create an update path', {:type => :feature}) do
  it('creates a word, goes to the word page, then goes to the edit word page') do
    word = Word.new("apple", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'a healthy fruit')
    click_on('Add definition')
    click_on('Edit word')
    expect(page).to have_content('Update: apple')
  end
end