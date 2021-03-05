class Word
  attr_reader :id, :name
  attr_accessor :name

  @@words = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def update(name)
    self.name = name
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def delete()
    @@words.delete(self.id)
  end

  def self.search(search_str)
    result_array = []
    @@words.each do |id, album|
      if word.name.downcase == search_str.downcase
        result_array.push(word)
      end
    end
    result_array
  end
end