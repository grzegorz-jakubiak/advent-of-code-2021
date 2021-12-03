require 'matrix'

class PowerConsumption
  def calculate(input)
    report = prepare_report(input)
    least_most = report.map do |row|
      row.tally.minmax_by { |_k, v| v}.to_h.keys
    end
    least_most.reduce(["", ""]) do |acc, (min, max)|
      acc[0] << min
      acc[1] << max
      acc
    end.map { _1.to_i(2) }.reduce(1, :*)
  end

  private

  def prepare_report(input)
    report = input.split("\n").map { _1.split('') }
    Matrix[*report].transpose.to_a
  end
end