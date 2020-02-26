class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def sorted_items_list
    all_names = []
    @vendors.each do |vendor|
      all_names << vendor.inventory.map do |item, quantity|
        item.name
      end
    end
    all_names.flatten.uniq.sort
  end

end
