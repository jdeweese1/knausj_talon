from talon import actions, Module, Context, app
from talon.mac import applescript

mod = Module()

@mod.action_class
class Actions:
    def play_pause():
        """Plays or pauses media"""
        if app.platform == "windows":
          actions.key("play_pause")
        else:
          actions.key("play")

    def media_set_volume(number:int):
        '''
        Sets volume
        '''

        applescript.run(f"""set volume {number/2}""")
