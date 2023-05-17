-- count_occurrences counts the number of occurrences of an element in a list
count_occurrences :: Eq a => a -> [a] -> Int
count_occurrences _ [] = 0
count_occurrences x (y:ys)
    | x == y = 1 + count_occurrences x ys
    | otherwise = count_occurrences x ys

-- array_statistics calculates the appearance statistics of each element in a list
array_statistics :: Eq a => [a] -> [(a, Int)]
array_statistics [] = []
array_statistics (x:xs) =
    let occurrences = count_occurrences x (x:xs)
        rest_stats = array_statistics (removeFirstOccurrence x xs)
    in (x, occurrences) : rest_stats

-- Remove the first occurrence of an element from the list
removeFirstOccurrence :: Eq a => a -> [a] -> [a]
removeFirstOccurrence _ [] = []
removeFirstOccurrence x (y:ys)
    | x == y = ys
    | otherwise = y : removeFirstOccurrence x ys


array4 :: [Int]
array4 = []

main :: IO ()
main = do
    let array = [1, 2, 3, 2, 1, 4, 5, 3, 2]
        stats = array_statistics array
    putStrLn $ "Array: " ++ show array
    putStrLn $ "Statistics: " ++ show stats

    let array2 = [1]
        stats2 = array_statistics array2
    putStrLn $ "Array: " ++ show array2
    putStrLn $ "Statistics: " ++ show stats2

    let array3 = [1, 2, 1, 2]
        stats3 = array_statistics array3
    putStrLn $ "Array: " ++ show array3
    putStrLn $ "Statistics: " ++ show stats3

    let stats4 = array_statistics array4
    putStrLn $ "Array: " ++ show array4
    putStrLn $ "Statistics: " ++ show stats4
