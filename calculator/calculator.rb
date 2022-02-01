def calculate(first_number, second_number, operator)
  case operator
  when "+"
    first_number + second_number
  when "-"
    first_number - second_number
  when "*"
    first_number * second_number
  when "/"
    first_number.to_f / second_number
  else
    "This is not a valid operation"
  end
end
