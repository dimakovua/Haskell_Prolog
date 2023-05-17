-- count_occurrences counts the number of occurrences of an element in a list
count_occurrences :: Eq a => a -> [a] -> Int
count_occurrences _ [] = 0  -- If the list is empty, the count is 0
count_occurrences x (y:ys)  -- If the head of the list matches the element we're counting...
    | x == y = 1 + count_occurrences x ys  -- ...count the occurrences of the element in the tail of the list...
    | otherwise = count_occurrences x ys  -- ...otherwise, count the occurrences of the element in the tail of the list

-- array_statistics calculates the appearance statistics of each element in a list
array_statistics :: Eq a => [a] -> [(a, Int)]
array_statistics [] = []  -- If the list is empty, return an empty list
array_statistics (x:xs) =
    let occurrences = count_occurrences x (x:xs)  -- Count the number of occurrences of the first element
        rest_stats = array_statistics (filter (/= x) xs)  -- Calculate the appearance statistics of the rest of the list
    in (x, occurrences) : rest_stats  -- Combine the results into a list of pairs



array4 :: [Int]
array4 = []

main :: IO ()
main = do
    let array = [1, 2, 3, 2, 1, 4, 5, 3, 2]
    let stats = array_statistics array
    putStrLn $ "Array: " ++ show array
    putStrLn $ "Statistics: " ++ show stats

    let array2 = [1]
    let stats2 = array_statistics array2
    putStrLn $ "Array: " ++ show array2
    putStrLn $ "Statistics: " ++ show stats2

    let array3 = [1, 2, 1, 2]
    let stats3 = array_statistics array3
    putStrLn $ "Array: " ++ show array3
    putStrLn $ "Statistics: " ++ show stats3

    let stats4 = array_statistics array4
    putStrLn $ "Array: " ++ show array4
    putStrLn $ "Statistics: " ++ show stats4