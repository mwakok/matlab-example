% Test classes are created by inheriting (< symbol) the  Matlab Testing 
% framework.
%
% e.g. classdef nameOfTest < matlab.unittest.TestCase
%      end

classdef test_example < matlab.unittest.TestCase 
    
    methods (Test) % Each test is it's own method function, and takes 
                   % testCase as their only argument.

        function test_uppercase(testCase) 
            actualValue = upper('loud noises');
            expectedValue = 'LOUD NOISES';
            testCase.assertEqual(expectedValue, actualValue)
        end
        
        function test_reversed(testCase)
            actualValue = flip([4 3 2 1]);
            expectedValue = [1 2 3 4];
            testCase.assertEqual(expectedValue, actualValue)
        end
        
        function test_some_primes(testCase)
            primes = [];
            for num = 1 : 50
                for div = 1 : num
                   if num ~=1 && ~any(mod(num,div))
                        primes(end+1) = num;
                   end
               end
            end
            expectedValue = 37;
            testCase.assertTrue(any(find(primes==expectedValue)))
        end
        
        function test_sumNumbers(testCase)
            actualValue = sumNumbers(2, 2);
            expectedValue = 4;
            testCase.assertEqual(expectedValue, actualValue)
        end
        
    end

    
end
