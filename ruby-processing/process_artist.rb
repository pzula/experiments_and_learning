require 'ruby-processing'
class ProcessArtist < Processing::App

  def setup
    background = background(1, 125, 300)
  end

  def draw
    #do something
  end

  def key_pressed
    warn "A key was pressed! #{key.inspect}"
    if @queue.nil?
      @queue = ""
    end
    if key != "\n"
      @queue = @queue + key
    else
      warn "Time to run the command: #{@queue}"
      command_parser(@queue)
      @queue = ""
    end
  end

  def command_parser(commands)
    if commands.start_with?("b")
      run_command(commands)
    else
      "Sorry, your commands must start with b for background"
    end
  end

  def run_command(command)
    puts "Running Command #{command}"
      commands = command[1..12].split(",")
      @color1 = commands[1].to_i
      @color2 = commands[2].to_i
      @color3 = commands[3].to_i
      background = background(@color1, @color2, @color3)
  end


end

ProcessArtist.new(:width => 800, :height => 800,
  :title => "ProcessArtist", :full_screen => false)
