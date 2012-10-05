module Test where

import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2 (testProperty)

import Test.QuickCheck
import Test.HUnit

import SplitUtil


case_onlyOneLine = split (stupidSlicer 10) "123" @?= ["123"]
case_twoLines = split (stupidSlicer 2) "123" @?= ["12", "3"]

prop_correctNumberOfLines i s = 
  (i > 0) ==> slicesLength  == expectedLength
  where slices = split (stupidSlicer i) s
	slicesLength = length slices
	expectedLength = (length s) /-% i  
        types = (i::Int, s::String)

prop_reversable i s =
  (i > 0) ==> recombined == s
    where sliced = split (stupidSlicer i) s
          recombined = foldl (++) "" sliced

tests = [
  testGroup "stupid slicer cases" [
    testCase "one line" case_onlyOneLine,
    testCase "two lines" case_twoLines
    ],
  testGroup "stupid slicer properties" [
    testProperty "correct number of lines" prop_correctNumberOfLines,
    testProperty "splittins is reversable" prop_reversable
    ]
  ]

runTests = defaultMain tests


(/-%) :: Int -> Int -> Int
a /-% b = base + rest
  where base = a `div` b
        m = a `mod` b
	rest = if (m == 0) then 0 else 1

