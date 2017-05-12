on run argv
  set image to POSIX file (item 1 of argv)
  tell app "Finder" to set the clipboard to image
end run