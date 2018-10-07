using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Class1
/// </summary>
public class IsNumber
{
    public bool Isnumber(string pValue)
    {
        foreach (Char c in pValue)
        {
            if (!Char.IsDigit(c))
                return false;
        }
        return true;
    }
}