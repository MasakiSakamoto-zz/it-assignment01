class VendingMachine
  USEABLE_MONEY = [10, 50, 100, 500, 1000]
  attr_reader :total, :sale_amount

  #初期化
  def initialize
    @total = 0
    @sale_amount = 0
    @drink_table = {}
    #ドリンククラスを作成したら5本格納の文を書く
    5.times { store ::Drink.coke }
  end

  #投入金額
  def insert(money)
    USEABLE_MONEY.include?(money) ? nil.tap { @total += money } : money
  end

  #お釣り
  def change
    total.tap { @total = 0}
  end

  def store(drink)
    nil.tap do
      @drink_table[drink.name] = { price: drink.price, drinks: [] } unless @drink_table.has_key? drink.name
      @drink_table[drink.name][:drinks] << drink
    end
  end

  def purchase(drink_name)
    if purchaseable? drink_name
      drink = @drink_table[drink_name][:drinks].pop
      @sale_amount += drink.price
      @total -= drink.price
      [drink,change]
    end
  end

  def purchaseable?(drink_name)
    purchaseable_drink_names.include? drink_name
  end

  def purchaseable_drink_names
    @drink_table.select{|_, info| info[:price] <= total && info[:drinks].any? }.keys
  end

  def stock_info
    Hash[@drink_table.map {|name, info| [name, { price: info[:price], stock: info[:drinks].size }] }]
  end
end
