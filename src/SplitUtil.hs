module SplitUtil where

import DataStructures

-- naive implementation to start with
stupidSlicer i s = ( take i s, drop i s  )

split :: (String -> (Line, String) ) -> String -> [Line]
split _  "" = []
split sl x  = line : split sl rest
              where (line, rest) = sl x


