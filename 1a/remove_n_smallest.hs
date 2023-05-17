
-- | This function takes an integer n and a list xs, and removes the n smallest elements from xs.
removeNLowest :: Ord a => Int -> [a] -> [a]
removeNLowest n xs
  -- If n is less than or equal to 0, return the original list xs.
  | n <= 0 = xs
  -- If the length of xs is less than or equal to n, return an empty list, since there are no elements to remove.
  | length xs <= n = []
  -- Otherwise, find the smallest element in xs, remove it from xs using filter, and recursively call removeNLowest with n-1 and the filtered list.
  | otherwise = let smallest = minimum xs  -- Find the smallest element in xs.
                    rest = filter (/= smallest) xs  -- Remove the smallest element from xs using filter.
                in removeNLowest (n-1) rest  -- Recursively call removeNLowest with n-1 and the filtered list.

main :: IO ()
main = do
    let arr = [3, 1, 4, 1, 5] 
    let arr2 = removeNLowest 1 arr
    putStrLn (show arr2)

    let arr3 = [3, 1, 4, 5]
    let arr4 = removeNLowest 2 arr3
    putStrLn (show arr4)

    let arr12 = [3, 1, 4, 1, 5] 
    let arr5 = removeNLowest 5 arr12
    putStrLn (show arr5)

    let arr123 = [3, 1, 4, 1, 5] 
    let arr6 = removeNLowest 0 arr123
    putStrLn(show arr6)

    let arr7 = [1, 2, 3, 4, 5]
    let arr8 = removeNLowest 3 arr7
    putStrLn (show arr8)