class Image

  def initialize(image_data)
    @rows = image_data

  end



  def output_image
    @rows.each do |row|
      puts row.join
    end
  end


  def items_with_a_value_of_1(n)
    @new_array = []
    n = n
    
    n.times do
      @rows.each_with_index do |row, rowindex|
        row.each_with_index do |item, itemindex|
          if item == 1
           @new_array << [rowindex, itemindex] #before alteration [@rows.index(row), row.index(item)]
          end
        end
      end

      puts @new_array.inspect
  
      @new_array.each do |item_position|

           if item_position[0] + 1 < @rows.length
             @rows[item_position[0] + 1][item_position[1]] = 1
           end

           if item_position[0] - 1 > -1  
             @rows[item_position[0] - 1][item_position[1]] = 1 
           end  

           if item_position[1] + 1 < @rows[0].length
             @rows[item_position[0]][item_position[1] + 1] = 1
           end

           if item_position[1] - 1 > -1
             @rows[item_position[0]][item_position[1] - 1] = 1
           end
      end

      output_image

#row number followed by column number
#lower item... item_positon must have a row index of 2 or lower (@rows.length -1)
#higher item.. item_position must have a row index of 1 or higher (>= 1)
#right item... item_positon must have a column index of 2 or lower(row.length - 1)
#left number... item_position must have a column index of 1 or higher
    end
  end
end



image = Image.new([
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0]
])

image.items_with_a_value_of_1(3)