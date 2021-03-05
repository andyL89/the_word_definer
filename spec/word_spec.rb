require 'rspec'
require 'word'
require 'pry'

describe '#Word' do

  before(:each) do
    Word.clear()
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

end