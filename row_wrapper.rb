require 'json'
require 'forwardable'

module ImportParts
  class RowWrapper
    extend Forwardable

    def_delegator :@row, :to_json

    attr_reader :row, :row_index
    
    def initialize(row: , row_index: , currency: 'руб')
      @row = row
      @row_index = row_index
      @currency = currency
    end

    [:part_number, :car_vendor, :car_model, :car_frame, :car_engine].each do |key|
      define_method key do 
        val = fetch_by_key(key)
        val&.strip
      end
    end

    [:price].each do |key|
      define_method key do 
        val = fetch_by_key(key)
        val = val.strip if val.is_a?(String)
        val.to_f
      end
    end

    def to_json
      row.to_json
    end

    private
    attr_reader :currency

    def fetch_by_key(key)
      if row.key?(key.to_sym)
        row[key.to_sym]
      elsif row.key?(key.to_s)
        row[key.to_s]
      else
        nil
      end
    end

    def method_missing(symbol, *args)
      if row.key?(symbol.to_sym)
        row[symbol.to_sym]
      elsif row.key?(symbol.to_s)
        row[symbol.to_s]
      else
        super
      end
    end
  end
end