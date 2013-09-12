module MoneyHelper
  def display_dollars(value_cents)
    "%.2f" % ((value_cents.to_f.abs)/100)
  end
end
