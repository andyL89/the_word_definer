require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("apple", nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new("a healthy fruit", @word.id, nil)
      definition2 = Definition.new("a healthy fruit", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new("up to date", @word.id, nil)
      definition.save()
      definition2 = Definition.new("flow of water", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new("very smart or intelligent", @word.id, nil)
      definition.save()
      definition2 = Definition.new("filled with light", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new("a healthy fruit", @word.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new("a musical group", @word.id, nil)
      definition.save()
      definition2 = Definition.new("a ring", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      definition = Definition.new("an animal with hair", @word.id, nil)
      definition.save()
      definition.update("an animal with feathers", @word.id)
      expect(definition.name).to(eq("an animal with feathers"))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      definition = Definition.new("a healthy vegetable", @word.id, nil)
      definition.save()
      definition2 = Definition.new("a healthy fruit", @word.id, nil)
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for a word") do
      word2 = Word.new("mammal", nil)
      word2.save
      definition = Definition.new("a healthy fruit", @word.id, nil)
      definition.save()
      definition2 = Definition.new("an animal with hair", word2.id , nil)
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
      definition = Definition.new("a healthy fruit", @word.id, nil)
      definition.save()
      expect(definition.word()).to(eq(@word))
    end
  end

end