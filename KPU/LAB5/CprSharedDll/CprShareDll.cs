using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CprSharedDll
{
    public class CprShareDll
    {
        public bool Check(string cprTxt, out CprError error)
        {
            DateTime formatedDate;
            if (CheckFormat(cprTxt) == CprError.FormatError)
            {
                error = CprError.FormatError;
                return false;
            }
            if (CheckDate(cprTxt) == CprError.DateError)
            {
                error = CprError.DateError;
                return false;
            }
            error = Check11Test(cprTxt);
            return true;
        }

        private CprError CheckDate(string cprTxt)
        {
            return CprError.NoError;
        }

        private CprError CheckFormat(string cprTxt)
        {
            var cprError = CprError.NoError;
            if (cprTxt.Length != 10)
                cprError = CprError.FormatError;

            return cprError;
        }

        /// <summary>
        /// The CPR check sum algorithm is calculated by mulitiplying each digit with a factor 
        /// and then add all results and divide the sum by 11.
        /// Factors: 4327654321
        /// CPR: 0609240121
        /// Sum: 0 + 18 + 0 + 72 + 12 + 20 + 0 + 1 + 4 + 1 = 121 / 11 = 11.0 -> CPR is OK
        /// </summary>
        private CprError Check11Test(string cprTxt)
        {
            CprError cprError = CprError.NoError;

            int sum = 0;
            for (int i = 0; i < 3; i++)
                sum += int.Parse(cprTxt.Substring(i, 1)) * (4 - i);
            for (int i = 3; i < 10; i++)
                sum += int.Parse(cprTxt.Substring(i, 1)) * (10 - i);
            if (sum % 11 != 0)
                cprError = CprError.Check11Error;

            return cprError;
        }
    }
    public enum CprError { NoError, FormatError, DateError, Check11Error };
}
