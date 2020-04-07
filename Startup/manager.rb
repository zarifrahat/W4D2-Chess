require_relative "employee"
require "byebug"

class Manager < Employee
    attr_reader :employees, :salaries 

    def initialize(name, title, salary, boss=nil)
        super(name, title, salary, boss)
        @employees = []
    end 

    def bonus(multiplier)
        self.salaries_sum * multiplier

    end

    def salaries_sum
        @salaries = []
        employees.each do |employee|
            if employee.is_a?(Manager)
                @salaries << employee.salaries_sum
                @salaries << employee.salary
            else
                @salaries << employee.salary
            end
        end 
        @salaries.sum
    end 
    
end 

David = Employee.new("David", "TA", 10000 , "Darren")
Shawna = Employee.new("Shawna", "TA", 12000 , "Darren")
Darren = Manager.new("Darren", "TA Manager", 78000 , "Ned")
Ned = Manager.new("Ned", "Founder", 1000000)

Darren.employees << David
Darren.employees << Shawna
Ned.employees << Darren

David
Shawna
Darren
Ned

p Ned.bonus(5)




