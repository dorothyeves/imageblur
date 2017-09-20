class Image
  def initialize (array)
    @image = array
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur!(distance=1)
    distance.times do
      blur_one!
    end
  end

  private

  def blur_one!
    blur_one = []

    @image.each_with_index do |row, i|
      row.each_with_index do |x, row_i|
        blur_one << [i, row_i] if x ==1
      end
    end

    blur_one.each do |section|
      @image[section[0]] [section[1] +1] = 1 if section[1] + 1 <= @image[section[0]].length - 1

      @image[section[0]] [section[1] -1] = 1 if section[1] - 1 >= 0
      
      @image[section[0]+ 1] [section[1]] = 1 if section[0] + 1 <= @image.length - 1

      @image[section[0] -1] [section[1]] = 1 if section[0] - 1 >=0
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0]
  ])

image.blur!
image.output_image
