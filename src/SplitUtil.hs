module SplitUtil where

import DataStructures

data ColumnsData = ColumnsData{text::String, width::Int, height::Int}

-- naive implementation to start with
stupidSlicer i s = ( take i s, drop i s  )

split :: (String -> (Line, String) ) -> String -> [Line]
split _  "" = []
split sl x  = line : split sl rest
              where (line, rest) = sl x

toDocument :: Int -> [Line] -> Document
toDocument _ [] = []
toDocument i ls = col : toDocument i rest
                  where col = take i ls
                        rest = drop i ls

document :: Int -> Int -> String -> Document
document lineLength lines = toDocument lines . split (stupidSlicer lineLength)



