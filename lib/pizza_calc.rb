
class PizzaCalc
  attr_reader :amount, :people

  def initialize(people)
    @people = people.to_i
    @amount = total
  end

  # X * 3/8 = P
  def total
    (people * 0.375).ceil
  end
end
