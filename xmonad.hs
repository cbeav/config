import XMonad
import XMonad.Actions.CopyWindow
import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.Script
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.EZConfig
import Data.Monoid
import System.Exit

main = xmonad =<< xmobar defaults

defaults = def
        { terminal = "gnome-terminal"
        , manageHook = manageSpawn <+> composeAll [ className =? "onboard" --> doIgnore ] <+> manageHook def
        , modMask = mod4Mask
        , workspaces = ["1","2","3","4","5","6","7","8","9"]
        }
        `additionalKeysP`
        [ ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10")
        , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10")
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
        , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
        , ("<XF86AudioMute>", spawn "amixer -D pulse set Master toggle")
        , ("<XF86AudioPlay>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
        , ("<XF86AudioPrev>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")
        , ("<XF86AudioNext>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")
        , ("M-S-<Left>", spawn "/home/chris/.xmonad/scripts/rotate.sh --left")
        , ("M-S-<Right>", spawn "/home/chris/.xmonad/scripts/rotate.sh --right")
        , ("M-S-<Up>", spawn "/home/chris/.xmonad/scripts/rotate.sh --up")
        , ("M-S-<Down>", spawn "/home/chris/.xmonad/scripts/rotate.sh --down")
        , ("M-<Up>", windows copyToAll)
        , ("M-<Down>", killAllOtherCopies)
        , ("M-<Left>", prevWS)
        , ("M-<Right>", nextWS)
        ]
