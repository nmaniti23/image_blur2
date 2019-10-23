class Image
  

    def initialize(array)
      @image = array
    end


    def output_image
      @image.each do |row|
        puts row.join
      end
    end


    def blur 
      coords = []
      @image.each_with_index do |row, row_index| 
        row.each_with_index do |element, col_index| 
          if element == 1 
              coords << {row_index: row_index, col_index: col_index} 
          end
        end
      end
      coords.each do |coord|
        blur_pixel(coord[:row_index], coord[:col_index]) 
      end
    end

    def blur_pixel (row_index, col_index) 
           

              @image[row_index - 1][col_index] = 1 unless row_index == 0 
              @image[row_index + 1][col_index] = 1 unless row_index == 3 
              @image[row_index][col_index + 1] = 1 unless col_index == 3 
              @image[row_index][col_index - 1] = 1 unless col_index == 0 
    end



end

  image = Image.new([
    [0, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, 0, 1],
    [0, 0, 0, 0]
  ])
 
  image.blur
  image.output_image