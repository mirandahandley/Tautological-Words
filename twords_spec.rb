require_relative 'twords'

describe "Twords" do
  it "can tell if a word can be matched by the tiles" do
    t = Twords.new
    t.match?("pies", "eips").should be_true
  end
  it "can tell if a word cannot be matched by the tiles"  do
    t = Twords.new
    t.match?("spies", "eips").should be_false
  end
  it "can tell if a word can be matched by only some of the tiles"  do
    t = Twords.new
    t.match?("pi", "eipsabcd").should be_true
  end
  it "uses the words with friends dictionary by default" do
    t = Twords.new
    t.dictionary.should == "words.txt"
  end
  it "can use a specified dictionary" do
    t = Twords.new "test_words.txt"
    t.dictionary.should == "test_words.txt"
  end
  it "can cycle through a bunch of words and pick out the matches" do
    t = Twords.new "test_words.txt"
    t.matches("eips").should == ["is\n"]
  end
end
