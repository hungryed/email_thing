class FindBadEmails
  def initialize(filename)
    @filename = filename
  end

  def read_file
    f = File.new(@filename, "r")
    @results=f.readlines
    @results
  end
end
