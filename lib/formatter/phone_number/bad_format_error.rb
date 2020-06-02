class BadFormatError < StandardError

  def initialize(msg="Error", exception_type="Invalid Format")
    @exception_type = exception_type
    super(msg)
  end
end