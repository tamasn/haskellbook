module Lib where

newtype DList a = DL { unDL :: [a] -> [a] }

empty :: DList a
empty = DL (\xs -> xs)
{-# INLINE empty #-}

singleton :: a -> DList a
singleton x = DL (x:)
{-# INLINE singleton #-}

toList :: DList a -> [a]
toList dl = unDL dl $ []
{-# INLINE toList #-}

infixr `cons`
cons :: a -> DList a -> DList a
cons x dl = DL (\xs -> x : (unDL dl $ xs))
{-# INLINE cons #-}

infixl `snoc`
snoc :: DList a -> a -> DList a
snoc dl x = DL (\xs -> (unDL dl $ xs ++ [x])) 
{-# INLINE snoc #-}

append :: DList a -> DList a -> DList a
append dl1 dl2 = DL ((unDL dl1) . (unDL dl2))
{-# INLINE append #-}