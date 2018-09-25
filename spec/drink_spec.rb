require 'rspec'
require './drink'

describe Drink do
  describe "==" do
    specify { expect(Drink.coke).to eq Drink.coke }
  end
end
