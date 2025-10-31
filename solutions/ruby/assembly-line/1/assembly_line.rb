class AssemblyLine
  MIN = 221
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    (MIN * @speed) * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end

  private

  def success_rate
    case @speed
    when 0..4 then 1.0
    when 5..8 then 0.9
    when 9 then 0.8
    when 10 then 0.77
    end
  end
end
