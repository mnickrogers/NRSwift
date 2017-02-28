//
//  Extensions
//  Copyright © 2016 Nicholas Rogers.
//

import Foundation

extension String
{
    
    subscript (i: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = characters.index(startIndex, offsetBy: r.lowerBound)
        let end = self.index(start, offsetBy: r.upperBound - r.lowerBound)
        return self[Range(start ..< end)]
    }
    
    /**
     Splits a string into first name for key 0 and last name for key 1
     */
    func splitFirstAndLastNames() -> [Int : String]
    {
        let split : Array = removeExcessSpaces(fromString: self).components(separatedBy: " ");
        
        var first = ""
        var last = ""
        
        if split.count > 1
        {
            for index in 1..<split.count
            {
                last += " " + split[index]
            }
        }
        else if split.count == 2
        {
            last = split[2]
        }
        else
        {
            return [0 : first]
        }
        
        last = last.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        first = split[0]
        
        return [0 : split[0], 1 : last]
    }
    
    func removeExcessSpaces(fromString str : String) -> String
    {
        let result = str.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).trimmingCharacters(in: CharacterSet.decimalDigits)
        let regEx : NSRegularExpression?
        
        do
        {
            regEx = try NSRegularExpression(pattern: " +|\n", options: .caseInsensitive)
        }
        catch
        {
            return ""
        }
        
        return regEx!.stringByReplacingMatches(in: result, options: .anchored, range:NSMakeRange(0, result.characters.count), withTemplate: " ");
    }
}

public extension Bool
{
    public init(_ i: Int)
    {
        if i >= 1
        {
            self = true
        }
        else
        {
            self = false
        }
    }
}

