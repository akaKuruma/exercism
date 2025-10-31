class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.split(']: ').last.strip
  end

  def log_level
    @line.match(/^\[(\D+)\]/)[1]&.downcase&.strip
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
