import gi
gi.require_version('GObject', '2.0')
gi.require_version('Gtk', '3.0')
gi.require_version('Nautilus', '3.0')
from gi.repository import GObject, Gtk, Nautilus


class ExtraKeybindings(GObject.GObject, Nautilus.LocationWidgetProvider):
    def __init__(self):
        pass

    def get_widget(self, uri, window):
        app = Gtk.Application.get_default()
        # app.set_accels_for_action('win.back', ['BackSpace', '<Alt>Left'])
        app.set_accels_for_action('win.up', ['BackSpace', '<Alt>Up'])
