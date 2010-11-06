class ShowDialog
  Button           = org.eclipse.swt.widgets.Button
  Display          = org.eclipse.swt.widgets.Display
  GridData         = org.eclipse.swt.layout.GridData
  GridLayout       = org.eclipse.swt.layout.GridLayout
  Label            = org.eclipse.swt.widgets.Label
  Shell            = org.eclipse.swt.widgets.Shell
  SWT              = org.eclipse.swt.SWT
  Text             = org.eclipse.swt.widgets.Text

  # Runs the application
  def initialize
    Display.app_name = 'SWT Rawr Hello World'
    display = Display.get_current

    @shell = Shell.new display
    @shell.text = "SWT Rawr Hello World"

    create_contents

    @shell.pack
    @shell.open

  end

  def run
    display = Display.get_current
    while !@shell.disposed? do
      display.sleep unless !display.read_and_dispatch
    end
  end

  # Creates the window contents
  def create_contents
    @shell.layout = GridLayout.new(6, true)

    Label.new(@shell, SWT::NONE).text = "Your name:"

    @name_box = Text.new(@shell, SWT::BORDER)
    layout_data = GridData.new(GridData::FILL_HORIZONTAL)
    layout_data.horizontalSpan = 4
    @name_box.layout_data = layout_data

    @status_label = Label.new(@shell, SWT::BORDER)
    layout_data = GridData.new(GridData::FILL_HORIZONTAL)
    layout_data.horizontalSpan = 3
    @status_label.layout_data = layout_data 


		@button = Button.new(@shell, SWT::PUSH)
		@button.text = "Click me!"
		layout_data = GridData.new(GridData::END, GridData::CENTER, false, false)
		layout_data.horizontalSpan = 6
		@button.layout_data = layout_data
    @button.addSelectionListener do
      handle_click
    end
  end

  def handle_click
    name = @name_box.text.strip
    name = 'World' if name.empty?
    @status_label.text = "Hello, #{name}!"
  end
end

ShowDialog.new.run
