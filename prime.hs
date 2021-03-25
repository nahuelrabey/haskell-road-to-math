-- * Chapter 1 of The Haskell RoadtoLogic, Math and Programming

divides :: Integral a => a -> a -> Bool
divides d n = rem n d == 0

ldf :: Integral t => t -> t -> t
ldf k n
  | k `divides` n = k
  | (k ^ 2) > n = n
  | otherwise = ldf (k + 1) n

ld :: Integral t => t -> t
ld n = ldf 2 n

prime0 :: Integral a => a -> Bool
prime0 n
  | n < 1 = error "not a positive integer"
  | n == 1 = False
  | otherwise = ld n == n

-- minumum int of a list
mnmInt :: [Int] -> Int
-- if recieves an empty list throw error
mnmInt [] = error "empty list"
-- if recieves a list with one item return item
mnmInt [x] = x
-- if recieves a list get the min of the first elem and the min of the rest of the list
mnmInt (x : xs) = min x (mnmInt xs)

-- * exc 1.9
mxmInt :: [Int] -> Int
mxmInt [] = error "empty list"
mxmInt [x] = x
mxmInt (x : xs) = max x (mxmInt xs)

-- * exc 1.10
-- removeFst [] = error "empty list"
-- removeFst :: [Int] -> Int -> [Int]
removeFst :: Eq t => [t] -> t -> [t]
removeFst [] x = []
removeFst [x] n | n /= x = [x]
removeFst (x : xs) n
  | n == x = xs
--   this removes the penultimate element of a lsit
--   | length xs == 1 && head xs /= n = xs
  | otherwise = x : removeFst xs n
