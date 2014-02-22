class Email
  def initialize(email)
    @email = email
    @comparison_pattern = /[^a-zA-Z0-9@\.\-_]/
    @errors = []
  end

  def validate_email
    check_for_special_characters
    check_for_extra_symbols
    check_for_extra_periods
  end

  def check_for_special_characters
    x = @email =~ @comparison_pattern
    if(x != nil)
      bad_characters = @email.scan(@comparison_pattern)
      position_array = find_bad_characters(bad_characters)
      @errors << "BAD=#{@email.scan(@comparison_pattern)} \nChar=#{position_array.to_s}"
    end
  end

  def check_for_extra_symbols
    y = @email.count "@"
    if(y != 1)
      @errors << "missing @ or too many"
    end
  end

  def check_for_extra_periods
    z = @email.match(/\@.*\./)
    if(z == nil)
      @errors << "missing ."
    end
  end

  def find_bad_characters(bad_characters)
    character_positions = []
    @email.split("").each_with_index do |letter, index|
      bad_characters.each do |character|
        character_positions << user_bad_letter(character, index)
      end
    end
    character_positions.delete(nil)
    character_positions.uniq.sort
  end


  def user_bad_letter(letter, letter_index=0)
    letter_index = @email.index(letter, letter_index)
    letter_index
  end

  def display_errors
    if @errors.any?
      puts "#{@email}"
      puts "Errors: "
      puts @errors.join("\n")
      puts "******************"
      puts "******************"
      puts " "
      puts " "
    end
  end

end
