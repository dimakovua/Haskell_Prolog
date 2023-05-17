-- | This function takes an integer n and a list xs, and removes the n smallest elements from xs.
removeNLowest :: Ord a => Int -> [a] -> [a]
removeNLowest n xs
    | n <= 0 = xs
    | length xs <= n = []
    | otherwise = removeNLowest' n xs

-- Helper function to remove n lowest elements from xs
removeNLowest' :: Ord a => Int -> [a] -> [a]
removeNLowest' _ [] = []
removeNLowest' 0 xs = xs
removeNLowest' n xs = let smallest = findSmallest xs
                            rest = removeFirstOccurrence smallest xs
                        in removeNLowest' (n-1) rest

-- Find the smallest element in the list
findSmallest :: Ord a => [a] -> a
findSmallest [x] = x
findSmallest (x:xs) = min x (findSmallest xs)

-- Remove the first occurrence of an element from the list
removeFirstOccurrence :: Eq a => a -> [a] -> [a]
removeFirstOccurrence _ [] = []
removeFirstOccurrence x (y:ys)
    | x == y = ys
    | otherwise = y : removeFirstOccurrence x ys

main :: IO ()
main = do
    let arr = [3, 1, 4, 1, 5] 
        arr2 = removeNLowest 1 arr
    putStrLn (show arr2)

    let arr3 = [3, 1, 4, 5]
        arr4 = removeNLowest 2 arr3
    putStrLn (show arr4)

    let arr12 = [3, 1, 4, 1, 5] 
        arr5 = removeNLowest 5 arr12
    putStrLn (show arr5)

    let arr123 = [3, 1, 4, 1, 5] 
        arr6 = removeNLowest 0 arr123
    putStrLn (show arr6)

    let arr7 = [1, 2, 3, 4, 5]
        arr8 = removeNLowest 3 arr7
    putStrLn (show arr8)
