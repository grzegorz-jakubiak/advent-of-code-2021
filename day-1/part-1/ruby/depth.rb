class Depth
  def count_increase(input)
    sonar_sweep_report = prepare_sonar_sweep_report(input)
    sonar_sweep_report.each_cons(2).count do |first, last|
      last > first
    end
  end

  private

  def prepare_sonar_sweep_report(file)
    file.split.map(&:to_i)
  end
end