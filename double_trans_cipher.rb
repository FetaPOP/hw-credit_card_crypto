# frozen_string_literal: true

module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    plaintext = document.to_s
    matrix_size = Math.sqrt(plaintext.length).ceil
    padded_plaintext = plaintext + (' ' * (matrix_size**2 - plaintext.length))

    # 2. break plaintext into evenly sized blocks
    sliced_plaintext = padded_plaintext.chars.each_slice(matrix_size).to_a

    # 3. sort rows in predictibly random way using key as seed
    sorted = random_sort(sliced_plaintext, key, true)

    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    sorted.map { |row| random_sort(row, key, true).join('') }.join('')
  end

  def self.decrypt(encrypted_document, key)
    # TODO: FILL THIS IN!
    ciphertext = encrypted_document.to_s
    matrix_size = Math.sqrt(ciphertext.length).ceil
    padded_ciphertext = (' ' * (matrix_size**2 - ciphertext.length)) + ciphertext

    sliced_ciphertext = padded_ciphertext.chars.each_slice(matrix_size).to_a

    sorted = random_sort(sliced_ciphertext, key, false)

    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    result = sorted.map { |row| random_sort(row, key, false).join('') }.join('')
    result.strip
  end

  def self.random_sort(input_array, random_key, enc_flag)
    sorted_array = Array.new(input_array.length)
    shuffle_arr = (0...input_array.length).to_a.shuffle(random: Random.new(random_key))
    shuffle_arr.each_with_index do |num, i|
      enc_flag ? sorted_array[i] = input_array[num] : sorted_array[num] = input_array[i]
    end
    sorted_array
  end
end
