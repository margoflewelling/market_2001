class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = ({})
    @inventory.default = 0
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    if @inventory.has_key?(item)
      inventory[item] += quantity
    else @inventory[item] = quantity
    end
  end

  def potential_revenue
    @inventory.sum do |item, quantity|
      (item.price.delete('$').to_f * quantity).round(2)
    end
  end
end
