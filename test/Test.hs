module Test where

import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2 (testProperty)

import Test.QuickCheck
import Test.HUnit

import SplitUtil
import DataStructuresUtil


case_onlyOneLine = split (stupidSlicer 10) "123" @?= ["123"]


tests = [
  testGroup "simple cases" [
    testCase "one line" case_onlyOneLine
    ]
  ]

runTests = defaultMain tests

