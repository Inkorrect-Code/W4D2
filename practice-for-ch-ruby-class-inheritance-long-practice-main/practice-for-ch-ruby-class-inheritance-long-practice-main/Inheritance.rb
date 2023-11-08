class Employee
    attr_reader :name, :title, :salary, :boss
  
    def initialize(name, title, salary, boss = nil)
      @name = name
      @title = title
      @salary = salary
      @boss = boss
    end
  
    def bonus(multiplier)
      salary * multiplier
    end
  end
  
  class Manager < Employee
    attr_reader :subordinates
  
    def initialize(name, title, salary, boss = nil)
      super(name, title, salary, boss)
      @subordinates = []
    end
  
    def add_subordinate(employee)
      @subordinates << employee
    end
  
    def total_subordinate_salary
      total_salary = 0
      subordinates.each do |subordinate|
        total_salary += subordinate.salary
        total_salary += subordinate.total_subordinate_salary if subordinate.is_a?(Manager)
      end
      total_salary
    end
  
    def bonus(multiplier)
      total_subordinate_salary * multiplier
    end
  end
  
  # Create the company structure
  ned = Manager.new("Ned", "Founder", 1_000_000)
  darren = Manager.new("Darren", "TA Manager", 78_000, ned)
  shawna = Employee.new("Shawna", "TA", 12_000, darren)
  david = Employee.new("David", "TA", 10_000, darren)
  
  ned.add_subordinate(darren)
  darren.add_subordinate(shawna)
  darren.add_subordinate(david)
  
  # Calculate bonuses
  puts ned.bonus(5)     # 500000
  puts darren.bonus(4)  # 88000
  puts david.bonus(3)   # 30000
  