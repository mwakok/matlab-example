classdef test_binomialRandom < matlab.unittest.TestCase 
    
    methods (Test)         
        function test_draw_numbers(testCase)
            n = 10:10:60
            p = 1./n
            actualValue = binomialRandom(n, p);
            expectedLength = 6;
            testCase.assertEqual(expectedLength, length(actualValue))
        end
        
    end

end
