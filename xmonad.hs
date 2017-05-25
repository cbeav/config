import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.EZConfig
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

main = xmonad =<< xmobar defaults
defaults = def
        { manageHook = manageSpawn <+> manageHook def
        , workspaces = ["1","2","3","4","5","6","7","8","9","0"]
        , startupHook = do
            spawnOn "1" "gnome-terminal"
            spawnOn "2" "google-chrome"
            spawnOn "3" "slack"
            spawnOn "4" "spotify"
        }
        `additionalKeysP`
        [("<XF86MonBrightnessUp>", spawn "xbacklight +10")
        ,("<XF86MonBrightnessDown>", spawn "xbacklight -10")
        ,("<XF86AudioRaiseVolume>", spawn "amixer set Master 5+ unmute")
        ,("<XF86AudioLowerVolume>", spawn "amixer set Master 5- unmute")
        ,("<XF86AudioMute>", spawn "amixer -D pulse set Master toggle")
        ,("<XF86AudioPlay>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
        ]
