-- use iTerm to replace Terminal
-- http://www.iterm2.com/documentation-scripting.html

on alfred_script(q)
  run script "
    on run {q}
      tell application \"iTerm\"
        set windowAmount to count window

        if windowAmount > 0
          activate
          tell current window to create tab with default profile
        else
          create window with default profile
        end if

        tell current window
          tell current session
        write text q
          end tell
        end tell
      end tell
    end run
  " with parameters {q}
end alfred_script