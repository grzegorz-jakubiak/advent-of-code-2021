class Coordinates
  def calculate(input)
    directions = prepare_directions(input)
    coordinates = directions.reduce({x: 0, y: 0, aim: 0}) do |acc, direction|
      move(direction, acc)
    end
    coordinates[:x] * coordinates[:y]
  end

  private

  def move(direction, position)
    position => {x:, y:, aim:}
    cor, number = direction.split(' ')
    case cor
    when 'forward'
      {x: x + number.to_i, y: y + (aim * number.to_i), aim: aim}
    when 'up'
      {x: x, y: y, aim: aim - number.to_i}
    when 'down'
      {x: x, y: y, aim: aim + number.to_i}
    end
  end

  def prepare_directions(file)
    file.split("\n")
  end
end