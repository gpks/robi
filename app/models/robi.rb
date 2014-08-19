require 'open-uri'

class Robi

  def initialize
   @id=2
 end

  def lock
   open("http://10.10.130.100:1234/#{@id}/lock").read
  end

  def forward
    open("http://10.10.130.100:1234/#{@id}/forward").read
  end

  def backward
    open("http://10.10.130.100:1234/#{@id}/backward").read
  end

  def slow_forward
    open("http://10.10.130.100:1234/#{@id}/slow_forward").read
  end

  def slow_backward
    open("http://10.10.130.100:1234/#{@id}/slow_backward").read
  end

  def left
    open("http://10.10.130.100:1234/#{@id}/left").read
  end

  def right
    open("http://10.10.130.100:1234/#{@id}/right").read
  end

  def run
    open("http://10.10.130.100:1234/#{@id}/run").read
  end

  def attack
    open("http://10.10.130.100:1234/#{@id}/attack").read
  end

  def proximity
    open("http://10.10.130.100:1234/proximity").read
  end

end

