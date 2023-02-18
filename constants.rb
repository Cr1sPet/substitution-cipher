# frozen_string_literal: true

module SubstitutionCipher
  module Constants
    RU_ABC = [*'а'..'я'].join('').concat(' ')
    ENCRYPTED_FILENAME = 'encrypted.txt'
    KEY_FILENAME = 'key.json'
    DECRYPTED_FILENAME = 'decrypted.txt'
  end
end
