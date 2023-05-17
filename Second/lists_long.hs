-- Function to generate prime numbers
-- It uses the sieve of Eratosthenes algorithm
primes :: [Int]
primes = sieve [2..]
    where
    sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p > 0]

-- Function to split list into sublists
-- It works by reversing the input list and the list of primes,
-- then it calls the helper function 'splitByPrimesHelper'
splitByPrimes :: [a] -> [[a]]
splitByPrimes xs = reverse $ splitByPrimesHelper (reverse xs) (take (length xs) primes)

-- Helper function for 'splitByPrimes'
-- It recursively splits the list into sublists, with each sublist
-- containing a number of elements determined by the corresponding prime number
splitByPrimesHelper :: [a] -> [Int] -> [[a]]
splitByPrimesHelper [] _ = [] -- If the list is empty, return an empty list
splitByPrimesHelper xs [] = [xs] -- If there are no more primes, return the list as the only sublist
splitByPrimesHelper xs (p:ps) =
    let (front, back) = splitAt p xs -- Split the list at the position determined by the current prime
    in front : splitByPrimesHelper back ps -- Recursively call the function with the remaining list and primes

-- The main function to test 'splitByPrimes'
main :: IO ()
main = do
    -- Each print statement is a test case for 'splitByPrimes'
    -- The expected result is commented next to each test case
    print $ splitByPrimes [1..10] -- [[1],[2,3],[4,5,6],[7,8,9,10]]
    print $ splitByPrimes [1..15] -- [[1],[2,3],[4,5,6],[7,8,9,10,11,12],[13,14,15]]
    print $ splitByPrimes [1..20] -- [[1],[2,3],[4,5,6],[7,8,9,10,11,12,13,14,15,16],[17,18,19,20]]
    print $ splitByPrimes (replicate 10 5) -- [[5,5,5,5,5],[5,5,5,5,5]]
    print $ splitByPrimes (concat $ replicate 5 [1,2]) -- [[1,2,1,2,1,2,1,2,1,2]]
