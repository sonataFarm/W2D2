class Employee

  attr_reader :salary, :name, :title, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

  def sum_subordinates_salary
    0
  end

end

class Manager < Employee
  def initialize(name, title, salary, boss)
    @employees = []
    super
  end

  def add_subordinates(subord)
    @employees = subord
  end

  def bonus(multiplier)
    sum_subordinates_salary * multiplier
  end

  def sum_subordinates_salary
    return 0 if @employees.empty?
    @employees.reduce(0) do |sum, subordinate|
      sum += subordinate.salary + subordinate.sum_subordinates_salary
    end
  end
end

ned = Manager.new('Ned', 'Founder', 1_000_000, nil)
darren = Manager.new('Darren', 'TA Manager', 78_000, ned)
shawna = Employee.new('Shawna', 'TA', 12_000, darren)
david = Employee.new('David', 'TA', 10_000, darren)

darren.add_subordinates([shawna, david])
ned.add_subordinates([darren])

p ned.bonus(5) == 500_000
p darren.bonus(4) == 88_000
p david.bonus(3) == 30_000
