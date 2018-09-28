require './vending_machine'
#require 'byebug'

class Drink
  attr_reader :name, :price

  def self.coke
    self.new 120, :coke
  end

  def self.redbull
    self.new 200, :redbull
  end

  def self.water
    self.new 100, :water
  end

  def initialize price, name
    #インスタンス変数
    @name = name
    @price = price
  end

  def ==(another)
    self.name == another.name
  end

  def eql?(another)
    self == another
  end

  def hash
    name.hash
  end

  def to_s
    "<Drink: name=#{name}, price=#{price}>"
  end
end

#vm = VendingMachine.new
#vm.insert 500
#vm.purchase :coke
