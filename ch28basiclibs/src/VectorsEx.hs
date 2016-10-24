module VectorsEx (mainVectorsEx) where

-- import Criterion.Main

import Control.Monad
import qualified Data.Vector as V
import qualified Data.Vector.Unboxed as UV

v :: V.Vector Int
v = V.fromList [1..1000]

uv :: UV.Vector Int
uv = UV.fromList [1..1000]

mainVectorsEx :: IO ()
mainVectorsEx = do
  replicateM_ 100000 $ (print v)
  replicateM_ 100000 $ (print uv)
