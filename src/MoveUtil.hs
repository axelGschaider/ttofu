module MoveUtil where 

import DataStructures


data Display = Display {column :: Int, document :: Document}

move :: Int -> Display -> Display
move i (Display c doc) = Display newCol doc
  where s = i + c
        maxCol = (length doc) - 1
        notToBig = min s maxCol
        newCol = max notToBig 0

moveLeft :: Display -> Display
moveLeft = move (-1)

moveRight :: Display -> Display
moveRight = move 1

display :: Document -> Display
display = Display 0

getColumns :: Int -> Display -> [Column]
getColumns i (Display col doc) = take i $ drop col doc

