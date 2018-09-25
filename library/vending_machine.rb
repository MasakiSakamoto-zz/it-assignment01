class VendingMachine
  #10円玉、50円玉、100円玉、500円玉、1000円札
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000]
  attr_reader :total, :sale_amount

  def initialize
    #初期化
    @total = 0
    @sale_amount = 0
    @drink_table = {}
    #ドリンククラスを作成したら5本格納の文を書く
    5.times { store Drink.cola }
  end

  def insert(money)
    #投入金額
    AVAILABLE_MONEY.include?(money) ? nil.tap{@total += money } : money
  end

  def refund
    #お釣り
    total.tap { @total = 0}
  end

  def store(drink)
    nil.tap do
      @drink_table[drink.name] = {price: drink.price, drinks: [] } unless @drink_table.has_key? drink.name
      @drink_table[drink.name][:drinks] << drink
    end
  end

  def purchase(drink_name)
    if purchaseable? drink_name
      drink = @drink[drink_name][:drinks].pop
      @sale_amount += drink.price
      @total -= drink.price
      [drink,refund]
    end
  end

  def purchaseable?(drink_name)
    purchaseable_drink_names.include? drink_name]
  end

  def purchaseable_drink_names
    @drink_table.select{|_, info| info[:price] <= total && info[:drinks].any? }.keys
  end

  def stock_info
    Hash[@drink_table.map {|name, info| [name, { price: info[:price], stock: info[:drinks].size }] }]
  end

end
