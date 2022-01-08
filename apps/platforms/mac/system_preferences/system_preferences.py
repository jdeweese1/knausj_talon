from talon.mac import applescript
from talon import Context, Module

import os

mod = Module()
# mod.apps.system_preferences = '''
# app.name: System Preferences
# app.bundle com.apple.systempreferences'''
# ctx = Context()
# ctx.matches = "app: System Preferences";


@mod.action_class
class SystemPreferencesActions:
    def bluetooth_focus():
        """Focuses on Bluetooth preferences"""
        applescript.run(r"""tell application "System Preferences"
        reveal pane "com.apple.preferences.Bluetooth"
    end tell""")

    def display_focus():
        """Focuses on display preferences"""
        applescript.run(r"""tell application "System Preferences"
        reveal pane "com.apple.preference.displays"
    end tell""")

    def keyboard_focus():
        """Focuses on keyboard preferences"""
        applescript.run(r"""tell application "System Preferences"
        reveal pane "com.apple.preference.keyboard"
    end tell""")

    def audio_focus():
        """Focuses on audio preferences"""
        applescript.run(r"""tell application "System Preferences"
        reveal pane "com.apple.preference.sound"
    end tell""")
