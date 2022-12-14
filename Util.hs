module Util where


split :: (a->Bool) -> [a] -> [[a]]
split p xs = case break p xs of
    (ys,[]) -> [ys]
    (ys,z:zs) -> ys : split p zs

chunksOf :: Int -> [a] -> [[a]]
chunksOf i xs = case splitAt i xs of
    (ys,[]) -> [ys]
    (ys,zs) -> ys : chunksOf i zs

stripSuffix :: Eq a => [a] -> [a] -> Maybe [a]
stripSuffix sfx (x:xs)
    | sfx == xs = Just [x]
    | otherwise = fmap (x:) (stripSuffix sfx xs)
stripSuffix sfx [] = Nothing