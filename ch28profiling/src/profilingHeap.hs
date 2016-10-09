module ProfilingHeap (mainHeap) where

import Control.Monad

blah :: [Integer]
blah = [1..1000]

mainHeap :: IO ()
mainHeap = replicateM_ 10000 (print blah)