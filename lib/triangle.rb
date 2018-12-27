class Triangle
  attr_accessor :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end

  def kind
    triangle_validation
    if equilateral?
      :equilateral
    elsif isosceles?
      :isosceles
    elsif scalene?
      :scalene
    end
  end

  class TriangleError < StandardError
  end

  private

  def equilateral?
    @side_a == @side_b && @side_b == @side_c
  end

  def isosceles?
    @side_a == @side_b || @side_b == @side_c || @side_a == @side_c
  end

  def scalene?
    @side_a != @side_b && @side_b != @side_c
  end

  def triangle_validation
    if negative_side ||
       side_inequality_1 ||
       side_inequality_2 ||
       side_inequality_3
      raise TriangleError
    end
  end

  def negative_side
    @side_a <= 0 || @side_b <= 0 || @side_c <= 0
  end

  def side_inequality_1
    @side_a + @side_b <= @side_c
  end

  def side_inequality_2
    @side_a + @side_c <= @side_b
  end

  def side_inequality_3
    @side_b + @side_c <= @side_a
  end
end
