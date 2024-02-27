using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
namespace Lab1
{
    public partial class Form1 : Form
    {
        Calculator calculator = new Calculator();
        public Form1()
        {
            InitializeComponent();
            mainLable.Text = null;
        }
        private void ButtonClick(object sender, EventArgs e)
        {
            mainLable.Text += ((System.Windows.Forms.Button)sender).Text;
        }
        private void CleanClick(object sender, EventArgs e)
        {
            mainLable.Text = null;
            secondLabel.Text = null;
            calculator.Clean();
        }
        private void OperationsClick(object sender, EventArgs e)
        {
            System.Windows.Forms.Button button = sender as System.Windows.Forms.Button;
            secondLabel.Text = button.Text;
            calculator.SetOperation(button.Tag.ToString());
        }
        private void DegreeClick(object sender, EventArgs e)
        {
            calculator.SetOperation(((System.Windows.Forms.Button)sender).Tag.ToString());
            if (calculator.SetVarA(mainLable.Text))
            {
                secondLabel.Text = mainLable.Text + "^";
            }
            else
            {
                secondLabel.Text = null;
            }
            mainLable.Text = null;
        }
        private void EqualClick(object sender, EventArgs e)
        {
            secondLabel.Text = null;
            mainLable.Text = calculator.Equal(mainLable.Text);
        }
        private void LastMemClick(object sender, EventArgs e)
        {
            secondLabel.Text = null;
            mainLable.Text = calculator.ShowLastMemory();
        }
        private void NextMemClick(object sender, EventArgs e)
        {
            secondLabel.Text = null;
            mainLable.Text = calculator.ShowNextMemory();
        }
        private bool dot = false;
        private void PointClick(object sender, EventArgs e)
        {
            if (!dot)
            {
                dot = true;
                mainLable.Text = mainLable.Text + ",";
            }
            dot = false;
        }
        private void MainLableClick(object sender, EventArgs e) { }
    }
}