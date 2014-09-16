import sys
Settings.MoveMouseDelay = 0.05
for x in range(0, int(sys.argv[1])):
  click("1410876305969.png")
  sleep(0.05)
  type(Key.SPACE)
  sleep(0.05)
  type('c', Key.CTRL)
  click("1410876325497.png")
  click("1410876337065.png")
  sleep(0.05)
  type('o')
  sleep(0.05)
  type('v', Key.CTRL + Key.SHIFT)
  type(Key.ESC)
  click("1410876305969.png")
  type(Key.DOWN)
