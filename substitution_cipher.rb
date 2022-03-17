# frozen_string_literal: true

module SubstitutionCipher
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String

    # ---------- Method 2
    # CHARS = [*?A..?Z, *?a..?z]

    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
      # ---------- Method 2 Only swift the A..Z, a..z
      # CHARS = [*?A..?Z, *?a..?z]
      # document.tr CHARS.join, CHARS.map{ |ary| ary.rotate key }.join
      # ---------- Method 3
      document.to_s.chars.map(&:ord).map { |c| c + key }.pack 'c*'
      # Use .pack'c*' replace '.map { |c| c.chr }.join'
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String

    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      #---------- Method 2  # Rotate in ASCII
      # document.tr CHARS.join, CHARS.map{ |cr| cr.rotate -key }.join
      # ---------- Method 3  # Only rotate in A..Z, a..z
      shifted = document.to_s.chars.map(&:ord).map { |c| c - key }
      shifted.map(&:chr).join
    end
  end

  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
      document = document.to_s.chars
      key_table = (0..127).to_a.shuffle!(random: Random.new(key))
      document.map! { |x| key_table.at(x.ord).chr }.join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
      document = document.to_s.chars
      key_table = (0..127).to_a.shuffle!(random: Random.new(key))
      document.map! { |x| key_table.index(x.ord).chr }.join
    end
  end
end
