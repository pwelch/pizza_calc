module ApplicationHelper
  def pluralize(amount)
    amount == 1 ? 'pizza' : 'pizzas'
  end
end
