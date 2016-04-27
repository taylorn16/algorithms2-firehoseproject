require 'spec_helper'

RSpec.describe LongestSubsequence, type: :module do
  describe "LongestSubsequence#find" do

    it "should result in nil when given nil" do
      longest = LongestSubsequence.find(nil, nil)
      expect(longest).to eq nil
    end

    it "should result in nil when given no common subsequences" do
      longest = LongestSubsequence.find("a", "b")
      expect(longest).to eq nil
    end

    it "should return the longest subsequence when given a short string" do
      longest = LongestSubsequence.find("ABCDAF", "ACBCF")
      expect(longest.chars.sort.join).to eq "ABCF"
    end

  end

  describe "LongestSubsequence.continuous_sequence_length" do

    it "should result in nil when given nil" do
      sequence = LongestSubsequence.shared_sequence(nil, nil)
      expect(sequence).to eq nil
    end

    it "should result in 0 when no sequence length is the same" do
      sequence = LongestSubsequence.shared_sequence("cats".chars, "dog".chars)
      expect(sequence[:length]).to eq 0
    end

    it "should result in the length of common sequence length for normal input" do
      sequence = LongestSubsequence.shared_sequence("stocks".chars, "store".chars)
      expect(sequence[:length]).to eq 3
      expect(sequence[:chars].join('')).to eq "sto"
    end

  end
end
