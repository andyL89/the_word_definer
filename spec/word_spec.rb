require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe '#Word' do

  before(:each) do
    Word.clear()
    Definition.clear()
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new("aptitude", nil)
      word.save()
      word2 = Word.new("debris", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("aptitude", nil)
      word.save()
      word2 = Word.new("debris", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end
  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new("duplicate", nil)
      word2 = Word.new("duplicate", nil)
      expect(word).to(eq(word2))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("fingerprint", nil)
      word.save()
      word2 = Word.new("apple", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word = Word.new("fingerprint", nil)
      word.save()
      word.update("copy")
      expect(word.name).to(eq("copy"))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new("remove", nil)
      word.save()
      word2 = Word.new("leftover", nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('#definitions') do
    it("returns a word's definitions") do
      word = Word.new("bark", nil)
      word.save()
      definition = Definition.new("a tree's outer layer", word.id, nil)
      definition.save()
      definition2 = Definition.new("the sound a dog makes", word.id, nil)
      definition2.save()
      expect(word.definitions).to(eq([definition, definition2]))
    end
  end

  describe('.search') do
    it("returns all words with names matching a given search string") do
      word = Word.new("apple", nil)
      word.save()
      word2 = Word.new("banana", nil)
      word2.save()
      search_result = Word.search("apple")
      expect(search_result[0] == word).to(eq(true))
    end
  end

end