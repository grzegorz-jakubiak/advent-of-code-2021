class Coordinates
  def calculate(input)
    directions = prepare_directions(input)
    directions.reduce({x: 0, y: 0}) do |acc, direction|
      move(direction, acc)
    end.values.inject(1, &:*)
  end

  private

  def move(direction, position)
    position => {x:, y:}
    cor, number = direction.split(' ')
    case cor
    when 'forward'
      {x: x + number.to_i, y: y}
    when 'up'
      {x: x, y: y - number.to_i}
    when 'down'
      {x: x, y: y + number.to_i}
    end
  end

  def prepare_directions(file)
    file.split("\n")
  end
end