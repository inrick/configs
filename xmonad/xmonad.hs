import Data.Ratio ((%))
import XMonad
import XMonad.Config.Kde (kdeConfig)
import XMonad.Actions.CycleWindows (cycleRecentWindows)
import XMonad.Actions.PhysicalScreens (onPrevNeighbour, onNextNeighbour)
import XMonad.Actions.WindowBringer (gotoMenuArgs, bringMenuArgs)
import XMonad.Hooks.EwmhDesktops (ewmh, fullscreenEventHook)
import XMonad.Hooks.ManageDocks (avoidStruts, manageDocks)
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
import XMonad.Hooks.SetWMName (setWMName)
import XMonad.Layout.Grid (Grid(..))
import XMonad.Layout.IM (withIM, Property(..))
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Layout.Reflect (reflectHoriz)
import XMonad.Layout.Tabbed (tabbedBottom, shrinkText, Theme(..), defaultTheme)
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Themes (theme, wfarrTheme)
import qualified XMonad.StackSet as W (view, shift)

myManageHook = composeAll
  [ manageHook kdeConfig
  , className =? "Klipper"         --> doFloat
  , className =? "MPlayer"         --> doFloat
  , className =? "mplayer2"        --> doFloat
  , className =? "mpv"             --> doFloat
  , className =? "Plasma-desktop"  --> doFloat
  , className =? "MainThrd"        --> doFloat
  , className =? "Empathy"         --> doShift "2"
  , className =? "Ktp-contactlist" --> doShift "2"
  , className =? "Ktp-text-ui"     --> doShift "2"
  , className =? "Skype"           --> doShift "2"
  , className =? "Wine"            --> doShift "9"
  , className =? "Spotify"         --> doShift "9"
  , isFullscreen                   --> doFullFloat
  , manageDocks
  ]

myWorkspaces = map show [1..9]

myKeys =
  [ ("M-z",              fb2kplay)
  , ("M-x",              fb2kprev)
  , ("M-c",              fb2knext)
  , ("<XF86AudioPlay>",  fb2kplay)
  , ("<XF86AudioPrev>",  fb2kprev)
  , ("<XF86AudioNext>",  fb2knext)
  , ("M-r",              spawn "rundmenu.sh")
  , ("M-g",              gotoMenuArgs  dmenuArgs)
  , ("M-S-b",            bringMenuArgs dmenuArgs)
  , ("C-M-l",            spawn "qdbus-qt4 org.freedesktop.ScreenSaver \
                               \/ScreenSaver Lock")
  , ("M-<Tab>",          cycleRecentWindows [xK_Super_L] xK_Tab xK_Tab)
  , ("C-M-e",            spawn "dolphin")
  , ("<XF86Calculator>", spawn "konsole -e calc")
  , ("M-w",              onPrevNeighbour W.view)
  , ("M-e",              onNextNeighbour W.view)
  , ("S-M-w",            onPrevNeighbour W.shift)
  , ("S-M-e",            onNextNeighbour W.shift)
  ]
  where fb2k      = "wine ~/.foobar2000/foobar2000.exe"
        fb2kplay  = spawn $ fb2k ++ " /playpause &> /dev/null"
        fb2kprev  = spawn $ fb2k ++ " /prev &> /dev/null"
        fb2knext  = spawn $ fb2k ++ " /next &> /dev/null"
        dmenuArgs = words "-b -i -l 15 -p $ -nb #43423D -nf white -sb #5e7f3e \
                          \-fn -*-terminus-*-*-*-*-12-120-*-*-*-*-iso8859-1"

myLayoutHook = avoidStruts
             . smartBorders
             . onWorkspace "1" web
             . onWorkspace "2" chat
             . onWorkspace "9" tabbed
             $ standard
  where standard  = tall ||| Grid ||| tabbed
        web       = tabbed ||| tall
        tall      = Tall 1 (3/100) (1/2)
        chat      = let contactL = (ClassName "Pidgin") `And`
                                   (Role "buddy_list") `Or`
                                   (ClassName "Empathy") `And`
                                   (Role "contact_list") `Or`
                                   (ClassName "Ktp-contactlist") `And`
                                   (Role "MainWindow")
                    in reflectHoriz . withIM (1%5) contactL . reflectHoriz $
                         tabbed ||| Grid
        tabbed    = let myTheme = (theme wfarrTheme)
                                  { fontName = "xft:terminus:size=8" }
                    {-let myTheme = defaultTheme
                                  { fontName            = "6x12"
                                  , decoHeight          = 12
                                  , activeColor         = "#5e7f3e"
                                  , activeBorderColor   = "#5e7f3e"
                                  , activeTextColor     = "white"
                                  , inactiveColor       = "#43423D"
                                  , inactiveBorderColor = "#43423D"
                                  , inactiveTextColor   = "white"
                                  , urgentColor         = "red"
                                  , urgentBorderColor   = "red"
                                  , urgentTextColor     = "white"
                                  } -}
                    in tabbedBottom shrinkText myTheme

main = let baseConfig = ewmh kdeConfig
  in xmonad $ baseConfig
  { modMask            = mod4Mask
  , terminal           = "konsole"
  , borderWidth        = 2
  , focusFollowsMouse  = False
  , focusedBorderColor = "#5B9CDA"
  , workspaces         = myWorkspaces
  , manageHook         = myManageHook
  , layoutHook         = myLayoutHook
  , handleEventHook    = handleEventHook baseConfig <+> fullscreenEventHook
  , startupHook        = startupHook baseConfig >> setWMName "LG3D"
  } `additionalKeysP` myKeys
