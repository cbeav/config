import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.Script
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.EZConfig
import Data.Monoid
import System.Exit

main = xmonad =<< xmobar defaults

defaults = def
        { manageHook = manageSpawn <+> composeAll [ className =? "onboard" --> doIgnore ] <+> manageHook def
        , modMask = mod4Mask
        , workspaces = ["1","2","3","4","5","6","7","8","9","0"]
        , startupHook = do
            spawnOn "1" "gnome-terminal"
            spawnOn "2" "google-chrome"
            spawnOn "3" "slack"
            spawnOn "9" "spotify"
            execScriptHook "redshift"
            execScriptHook "xautolock"
            execScriptHook "gnome-screensaver"
        }
        `additionalKeysP`
        [ ("<XF86MonBrightnessUp>", spawn "/home/chris/.bullshit/bright +")
        , ("<XF86MonBrightnessDown>", spawn "/home/chris/.bullshit/bright -")
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5+ unmute")
        , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5- unmute")
        , ("<XF86AudioMute>", spawn "amixer -D pulse set Master toggle")
        , ("<XF86AudioPlay>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
        , ("<XF86AudioPrev>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")
        , ("<XF86AudioNext>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")
        , ("M-<Left>", spawn "/home/chris/.bullshit/rotate.sh --left")
        , ("M-<Right>", spawn "/home/chris/.bullshit/rotate.sh --right")
        , ("M-<Up>", spawn "/home/chris/.bullshit/rotate.sh --up")
        , ("M-<Down>", spawn "/home/chris/.bullshit/rotate.sh --down")
        ]
