

require 'fox16'

include Fox

class HelloWorldWindow < FXMainWindow
  def initialize(app)
    super(app, 'Hello World Program')

    @mtx = FXMatrix.new(self, 6)

    turn = :red

    8.times do
      6.times do |i|
        btn = FXButton.new(@mtx, '', :opts => BUTTON_NORMAL|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT, :width => 50, :height => 50)

        if i == 0 || i == 1
          btn.backColor = "red"
        elsif i == 2 || i == 3
          btn.backColor = "white"
        elsif i == 4 || i == 5
          btn.backColor = "blue"
        end

        btn.connect(SEL_COMMAND) do
          if btn.backColor == 4294967295 # white
            # nothing
          elsif btn.backColor == Fox.fxcolorfromname("red") # red
            btn.backColor = "white"
            btn_row = @mtx.rowOfChild(btn)
            btn_col = @mtx.colOfChild(btn)
            new_btn = @mtx.childAtRowCol(btn_row+1, btn_col)
            new_btn.backColor = "red"

          elsif btn.backColor ==  Fox.fxcolorfromname("blue") # blue
            btn.backColor = "white"
            btn_row = @mtx.rowOfChild(btn)
            btn_col = @mtx.colOfChild(btn)
            new_btn = @mtx.childAtRowCol(btn_row-1, btn_col)
            new_btn.backColor = "blue"
          end
        end
        def sample
          sample
        end
        array = [1, 2, 3, 4, 5]
        array.random = btn
      end
    end
  end
  # don't touch this
  def create
    super
    self.show(PLACEMENT_SCREEN)
  end
end

# never touch these
app = FXApp.new
HelloWorldWindow.new(app)
app.create
app.run

