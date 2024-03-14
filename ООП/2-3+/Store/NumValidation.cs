using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.ComponentModel;
using System.Text.RegularExpressions;
using System.ComponentModel.DataAnnotations;
namespace WindowsFormsApp2
{
    public class NumValidation : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            var Num = value;
            if (Num.ToString().Length <= 5)
            {
                return true;
            }
            return false;
        }
    }
}