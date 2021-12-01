class Depth
  def count_sum_increase(input)
    sonar_sweep_report = prepare_sonar_sweep_report(input)
    sonar_sweep_report.each_cons(3).filter_map do |list|
      list.sum if list.size == 3
    end.each_cons(2).select { |list| list.size == 2 }.count do |first, last|
      last > first
    end
  end

  private

  def prepare_sonar_sweep_report(file)
    file.split.map(&:to_i)
  end
end