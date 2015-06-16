puts "Welcome to Checkers!"

puts "Rules:
- Each piece is only allowed to move on a diagonal one space at a time
- To take one of the opponents pieces one must click on their piece
- When completed the user must exit the game"

$movearray = []
    $movenum = 0
50.times do
  $movenum = $movenum + 2
  $movearray.push $movenum
end
puts $movearray.inspect
require 'fox16'
include Fox
$turn= 'go'
class CheckersButton < FXButton
  def initialize(parent, text, color=:gray, textcolor=:gray)
    super(parent, text, :opts => BUTTON_NORMAL|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT, :width => 50, :height => 50)

    self.backColor = color
    self.text = "O"
    self.textColor = textcolor
    @color = color

    self.connect(SEL_COMMAND) do

      if  $turn == 'go' then
        if self.backColor == Fox.fxcolorfromname('red')
          self.backColor = :pink
          $putcolor = 'red'
          sleep(1)
          self.backColor = :gray
          $turn = 'move'
        elsif self.backColor == Fox.fxcolorfromname('black')
          self.backColor = :blue
          $putcolor = 'black'
          sleep(1)
          self.backColor = :gray
          $turn = 'move'
        else @color == :gray
        FXMessageBox.information(self, MBOX_OK, "Try again.", "Please click on a piece.")
        end
      else
        if $putcolor == 'red' then
          self.backColor = :red
          $turn = 'go'
        else
          self.backColor = :black
          $turn = 'go'
        end
      end
      end
  end
end

class CheckersWindow < FXMainWindow
  def initialize(app)
    super(app, "Checkers")
    @mtx = FXMatrix.new(self, 8)
    8.times do |i|
      if i%2==0
        CheckersButton.new(@mtx, nil, :black)
      else
        CheckersButton.new(@mtx, nil)
      end
    end
    8.times  do |i|
      if i%2==1
        CheckersButton.new(@mtx, nil, :black)
      else
        CheckersButton.new(@mtx, nil)
      end
    end
    8.times do |i|
      if i%2==0
        CheckersButton.new(@mtx, nil, :black)
      else
        CheckersButton.new(@mtx, nil)
      end
    end
    16.times do
      CheckersButton.new(@mtx, nil)
    end
    8.times do |i|
      if i%2==1
        CheckersButton.new(@mtx, nil, :red)
      else
        CheckersButton.new(@mtx, nil)
      end
    end
    8.times  do |i|
      if i%2==0
        CheckersButton.new(@mtx, nil, :red)
      else
        CheckersButton.new(@mtx, nil,)
      end
    end
    8.times do |i|
      if i%2==1
        CheckersButton.new(@mtx, nil, :red)
      else
        CheckersButton.new(@mtx, nil)
      end
    end
  end


  def create
    super
    self.show(PLACEMENT_SCREEN)
  end
end

app = FXApp.new
CheckersWindow.new(app)
app.create
app.run

