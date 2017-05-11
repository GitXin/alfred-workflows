on run argv
  tell application "Preview"
      activate
      open item 1 of argv
  end tell
  tell application "System Events"
      tell process "Preview"
          keystroke "c" using command down
      end tell
  end tell
  tell application "Preview" to quit
end run