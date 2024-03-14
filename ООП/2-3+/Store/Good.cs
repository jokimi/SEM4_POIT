using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Windows.Forms;
using System.ComponentModel.DataAnnotations;

namespace WindowsFormsApp2
{
    public class Good
    {
        public string Name { get; set; }
        [NumValidation(ErrorMessage = "Номер не может содержать более 5 цифр!")]
        public int Num { get; set; }
        public enum GoodSizes
        {
            Small,
            Average,
            Big,
            VeryBig,
            Huge
        }
        public GoodSizes Sizes { get; set; }
        public int Weight { get; set; }
        public enum Types
        {
            Food,
            Clothes,
            Service
        }
        public Types Type { get; set; }
        public DateTime DateTime { get; set; }
        public int Count { get; set; }
        public int Price { get; set; }
        public string Producer { get; set; }
        public override string ToString()
        {
            return "Имя: " + Name + "\nИнв. Номер: " + Num + "\nВес: " + Weight + "\nТип: " +
                Type + "\nДата: " + DateTime + "\nЦена: " + Price + "\nКоличество: " + Count +
                "\nПроизводитель: " + Producer + "\n\n";
        }
    }
}