module SetTest (mainSet) where

import Criterion.Main

import qualified Data.Map as M
import qualified Data.Set as S

bumpIt (i, v) = (i + 1, v + 1)

m :: M.Map Int Int
m = M.fromList $ take 10000 stream
  where stream = iterate bumpIt (0, 0)

s :: S.Set Int
s = S.fromList $ take 10000 stream
  where stream = iterate (+1) 0

membersMap :: Int -> Bool
membersMap i = M.member i m

membersSet :: Int -> Bool
membersSet i = S.member i s

lookupGTMap :: Int -> Maybe (Int, Int)
lookupGTMap i = M.lookupGT i m

lookupGTSet :: Int -> Maybe Int
lookupGTSet i = S.lookupGT i s

mainSet :: IO ()
mainSet = defaultMain
  [ bench "lookupGT check map" $
    whnf lookupGTMap 9999
  , bench "lookupGT check set" $
    whnf lookupGTSet 9999
  ]