module Texts (mainTexts) where

import Control.Monad
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import qualified System.IO as SIO

dictWords :: IO String
dictWords  = SIO.readFile "/usr/share/dict/words"

dictWordsT :: IO T.Text
dictWordsT  = TIO.readFile "/usr/share/dict/words"

mainTexts :: IO ()
mainTexts = do
  replicateM_ 10 (dictWords >>= print)
  replicateM_ 10 (dictWordsT >>= TIO.putStrLn)