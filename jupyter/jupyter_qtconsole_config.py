# jupyter qtconsole --generate-config

import os

c.JupyterWidget.editor = os.environ['EDITOR']

c.ConsoleWidget.buffer_size = 10000
c.ConsoleWidget.console_height = 26
c.ConsoleWidget.console_width = 84
c.ConsoleWidget.font_family = 'Inconsolata Medium'
c.ConsoleWidget.font_size = 13
c.ConsoleWidget.gui_completion = 'ncurses'

c.JupyterQtConsoleApp.stylesheet = os.path.join(os.environ['HOME'], '.jupyter', 'qtconsole.css')
