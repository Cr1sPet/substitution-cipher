# frozen_string_literal: true

module SubstitutionCipher
  module Constants
    RU_ABC = " #{[*'а'..'я'].join('')}".freeze
    ENCRYPTED_FILENAME = 'encrypted.txt'
    KEY_FILENAME = 'key.json'
    RESTORED_KEY_FILENAME = 'restored_key.json'
    DECRYPTED_FILENAME = 'decrypted.txt'
    RU_POPULAR_CHAR = 'оефитнсрвлкмдпуяызбгьчйхяжюшцэъф'
  end
end
