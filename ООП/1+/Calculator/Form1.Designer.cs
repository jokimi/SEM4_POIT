using System.Drawing.Drawing2D;
using System.Drawing;
using System.ComponentModel;
using System.Windows.Forms;
using Calculator;
namespace Lab1
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;
        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }
        #region Код, автоматически созданный конструктором форм Windows
        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.mainLable = new System.Windows.Forms.Label();
            this.buttonLastMem = new System.Windows.Forms.Button();
            this.buttonNextMem = new System.Windows.Forms.Button();
            this.buttonCot = new System.Windows.Forms.Button();
            this.buttonTan = new System.Windows.Forms.Button();
            this.buttonDegree = new System.Windows.Forms.Button();
            this.buttonEqual = new System.Windows.Forms.Button();
            this.buttonAcos = new System.Windows.Forms.Button();
            this.buttonSqrt3 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.buttonClean = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.buttonCos = new System.Windows.Forms.Button();
            this.button6 = new System.Windows.Forms.Button();
            this.buttonPoint = new System.Windows.Forms.Button();
            this.buttonSqrt2 = new System.Windows.Forms.Button();
            this.buttonSin = new System.Windows.Forms.Button();
            this.button9 = new System.Windows.Forms.Button();
            this.button8 = new System.Windows.Forms.Button();
            this.button7 = new System.Windows.Forms.Button();
            this.secondLabel = new System.Windows.Forms.Label();
            this.button0 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // mainLable
            // 
            this.mainLable.Font = new System.Drawing.Font("Microsoft Sans Serif", 28.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.mainLable.Location = new System.Drawing.Point(9, 37);
            this.mainLable.Name = "mainLable";
            this.mainLable.Size = new System.Drawing.Size(389, 63);
            this.mainLable.TabIndex = 1;
            this.mainLable.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.mainLable.Click += new System.EventHandler(this.MainLableClick);
            // 
            // buttonLastMem
            // 
            this.buttonLastMem.BackColor = System.Drawing.Color.Black;
            this.buttonLastMem.FlatAppearance.BorderSize = 0;
            this.buttonLastMem.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonLastMem.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.buttonLastMem.ForeColor = System.Drawing.Color.Orange;
            this.buttonLastMem.Location = new System.Drawing.Point(9, 301);
            this.buttonLastMem.Name = "buttonLastMem";
            this.buttonLastMem.Size = new System.Drawing.Size(60, 60);
            this.buttonLastMem.TabIndex = 0;
            this.buttonLastMem.Text = "←";
            this.buttonLastMem.UseVisualStyleBackColor = false;
            this.buttonLastMem.Click += new System.EventHandler(this.LastMemClick);
            // 
            // buttonNextMem
            // 
            this.buttonNextMem.BackColor = System.Drawing.Color.Black;
            this.buttonNextMem.FlatAppearance.BorderSize = 0;
            this.buttonNextMem.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonNextMem.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.buttonNextMem.ForeColor = System.Drawing.Color.Orange;
            this.buttonNextMem.Location = new System.Drawing.Point(141, 301);
            this.buttonNextMem.Name = "buttonNextMem";
            this.buttonNextMem.Size = new System.Drawing.Size(60, 60);
            this.buttonNextMem.TabIndex = 3;
            this.buttonNextMem.Text = "→";
            this.buttonNextMem.UseVisualStyleBackColor = false;
            this.buttonNextMem.Click += new System.EventHandler(this.NextMemClick);
            // 
            // buttonCot
            // 
            this.buttonCot.BackColor = System.Drawing.Color.Orange;
            this.buttonCot.FlatAppearance.BorderSize = 0;
            this.buttonCot.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonCot.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.buttonCot.Location = new System.Drawing.Point(207, 301);
            this.buttonCot.Name = "buttonCot";
            this.buttonCot.Size = new System.Drawing.Size(60, 60);
            this.buttonCot.TabIndex = 4;
            this.buttonCot.Tag = "cot";
            this.buttonCot.Text = "cot";
            this.buttonCot.UseVisualStyleBackColor = false;
            this.buttonCot.Click += new System.EventHandler(this.OperationsClick);
            // 
            // buttonTan
            // 
            this.buttonTan.BackColor = System.Drawing.Color.Orange;
            this.buttonTan.FlatAppearance.BorderSize = 0;
            this.buttonTan.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonTan.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.buttonTan.Location = new System.Drawing.Point(207, 235);
            this.buttonTan.Name = "buttonTan";
            this.buttonTan.Size = new System.Drawing.Size(60, 60);
            this.buttonTan.TabIndex = 10;
            this.buttonTan.Tag = "tan";
            this.buttonTan.Text = "tan";
            this.buttonTan.UseVisualStyleBackColor = false;
            this.buttonTan.Click += new System.EventHandler(this.OperationsClick);
            // 
            // buttonDegree
            // 
            this.buttonDegree.BackColor = System.Drawing.Color.Orange;
            this.buttonDegree.FlatAppearance.BorderSize = 0;
            this.buttonDegree.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonDegree.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.buttonDegree.Location = new System.Drawing.Point(273, 235);
            this.buttonDegree.Name = "buttonDegree";
            this.buttonDegree.Size = new System.Drawing.Size(60, 60);
            this.buttonDegree.TabIndex = 11;
            this.buttonDegree.Tag = "degree";
            this.buttonDegree.Text = "^";
            this.buttonDegree.UseVisualStyleBackColor = false;
            this.buttonDegree.Click += new System.EventHandler(this.DegreeClick);
            // 
            // buttonEqual
            // 
            this.buttonEqual.BackColor = System.Drawing.Color.White;
            this.buttonEqual.FlatAppearance.BorderSize = 0;
            this.buttonEqual.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonEqual.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.buttonEqual.ForeColor = System.Drawing.Color.Orange;
            this.buttonEqual.Location = new System.Drawing.Point(273, 301);
            this.buttonEqual.Name = "buttonEqual";
            this.buttonEqual.Size = new System.Drawing.Size(126, 60);
            this.buttonEqual.TabIndex = 5;
            this.buttonEqual.Text = "=";
            this.buttonEqual.UseVisualStyleBackColor = true;
            this.buttonEqual.Click += new System.EventHandler(this.EqualClick);
            // 
            // buttonAcos
            // 
            this.buttonAcos.BackColor = System.Drawing.Color.Orange;
            this.buttonAcos.FlatAppearance.BorderSize = 0;
            this.buttonAcos.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonAcos.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.buttonAcos.Location = new System.Drawing.Point(339, 235);
            this.buttonAcos.Name = "buttonAcos";
            this.buttonAcos.Size = new System.Drawing.Size(60, 60);
            this.buttonAcos.TabIndex = 6;
            this.buttonAcos.Tag = "acos";
            this.buttonAcos.Text = "-";
            this.buttonAcos.UseVisualStyleBackColor = false;
            this.buttonAcos.Click += new System.EventHandler(this.ButtonClick);
            // 
            // buttonSqrt3
            // 
            this.buttonSqrt3.BackColor = System.Drawing.Color.Orange;
            this.buttonSqrt3.FlatAppearance.BorderSize = 0;
            this.buttonSqrt3.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonSqrt3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.buttonSqrt3.Location = new System.Drawing.Point(273, 169);
            this.buttonSqrt3.Name = "buttonSqrt3";
            this.buttonSqrt3.Size = new System.Drawing.Size(60, 60);
            this.buttonSqrt3.TabIndex = 17;
            this.buttonSqrt3.Tag = "sqrt3";
            this.buttonSqrt3.Text = "³√";
            this.buttonSqrt3.UseVisualStyleBackColor = false;
            this.buttonSqrt3.Click += new System.EventHandler(this.OperationsClick);
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.Black;
            this.button1.FlatAppearance.BorderSize = 0;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.button1.Location = new System.Drawing.Point(9, 235);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(60, 60);
            this.button1.TabIndex = 7;
            this.button1.Text = "1";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.ButtonClick);
            // 
            // button2
            // 
            this.button2.BackColor = System.Drawing.Color.Black;
            this.button2.FlatAppearance.BorderSize = 0;
            this.button2.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.button2.Location = new System.Drawing.Point(75, 235);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(60, 60);
            this.button2.TabIndex = 8;
            this.button2.Text = "2";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.ButtonClick);
            // 
            // button5
            // 
            this.button5.BackColor = System.Drawing.Color.Black;
            this.button5.FlatAppearance.BorderSize = 0;
            this.button5.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button5.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.button5.Location = new System.Drawing.Point(75, 169);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(60, 60);
            this.button5.TabIndex = 14;
            this.button5.Text = "5";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.ButtonClick);
            // 
            // button3
            // 
            this.button3.BackColor = System.Drawing.Color.Black;
            this.button3.FlatAppearance.BorderSize = 0;
            this.button3.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.button3.Location = new System.Drawing.Point(141, 235);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(60, 60);
            this.button3.TabIndex = 9;
            this.button3.Text = "3";
            this.button3.UseVisualStyleBackColor = false;
            this.button3.Click += new System.EventHandler(this.ButtonClick);
            // 
            // buttonClean
            // 
            this.buttonClean.BackColor = System.Drawing.Color.Orange;
            this.buttonClean.FlatAppearance.BorderSize = 0;
            this.buttonClean.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonClean.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.buttonClean.Location = new System.Drawing.Point(339, 169);
            this.buttonClean.Name = "buttonClean";
            this.buttonClean.Size = new System.Drawing.Size(60, 60);
            this.buttonClean.TabIndex = 18;
            this.buttonClean.Text = "C";
            this.buttonClean.UseVisualStyleBackColor = false;
            this.buttonClean.Click += new System.EventHandler(this.CleanClick);
            // 
            // button4
            // 
            this.button4.BackColor = System.Drawing.Color.Black;
            this.button4.FlatAppearance.BorderSize = 0;
            this.button4.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.button4.Location = new System.Drawing.Point(9, 169);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(60, 60);
            this.button4.TabIndex = 13;
            this.button4.Text = "4";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.ButtonClick);
            // 
            // buttonCos
            // 
            this.buttonCos.BackColor = System.Drawing.Color.Orange;
            this.buttonCos.FlatAppearance.BorderSize = 0;
            this.buttonCos.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonCos.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.buttonCos.Location = new System.Drawing.Point(207, 169);
            this.buttonCos.Name = "buttonCos";
            this.buttonCos.Size = new System.Drawing.Size(60, 60);
            this.buttonCos.TabIndex = 16;
            this.buttonCos.Tag = "cos";
            this.buttonCos.Text = "cos";
            this.buttonCos.UseVisualStyleBackColor = false;
            this.buttonCos.Click += new System.EventHandler(this.OperationsClick);
            // 
            // button6
            // 
            this.button6.BackColor = System.Drawing.Color.Black;
            this.button6.FlatAppearance.BorderSize = 0;
            this.button6.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button6.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.button6.Location = new System.Drawing.Point(141, 169);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(60, 60);
            this.button6.TabIndex = 15;
            this.button6.Text = "6";
            this.button6.UseVisualStyleBackColor = false;
            this.button6.Click += new System.EventHandler(this.ButtonClick);
            // 
            // buttonPoint
            // 
            this.buttonPoint.BackColor = System.Drawing.Color.Orange;
            this.buttonPoint.FlatAppearance.BorderSize = 0;
            this.buttonPoint.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonPoint.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.buttonPoint.Location = new System.Drawing.Point(339, 103);
            this.buttonPoint.Name = "buttonPoint";
            this.buttonPoint.Size = new System.Drawing.Size(60, 60);
            this.buttonPoint.TabIndex = 15;
            this.buttonPoint.Text = ".";
            this.buttonPoint.UseVisualStyleBackColor = false;
            this.buttonPoint.Click += new System.EventHandler(this.PointClick);
            // 
            // buttonSqrt2
            // 
            this.buttonSqrt2.BackColor = System.Drawing.Color.Orange;
            this.buttonSqrt2.FlatAppearance.BorderSize = 0;
            this.buttonSqrt2.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonSqrt2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.buttonSqrt2.Location = new System.Drawing.Point(273, 103);
            this.buttonSqrt2.Name = "buttonSqrt2";
            this.buttonSqrt2.Size = new System.Drawing.Size(60, 60);
            this.buttonSqrt2.TabIndex = 23;
            this.buttonSqrt2.Tag = "sqrt2";
            this.buttonSqrt2.Text = "²√";
            this.buttonSqrt2.UseVisualStyleBackColor = false;
            this.buttonSqrt2.Click += new System.EventHandler(this.OperationsClick);
            // 
            // buttonSin
            // 
            this.buttonSin.BackColor = System.Drawing.Color.Orange;
            this.buttonSin.FlatAppearance.BorderSize = 0;
            this.buttonSin.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonSin.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.buttonSin.Location = new System.Drawing.Point(207, 103);
            this.buttonSin.Name = "buttonSin";
            this.buttonSin.Size = new System.Drawing.Size(60, 60);
            this.buttonSin.TabIndex = 22;
            this.buttonSin.Tag = "sin";
            this.buttonSin.Text = "sin";
            this.buttonSin.UseVisualStyleBackColor = false;
            this.buttonSin.Click += new System.EventHandler(this.OperationsClick);
            // 
            // button9
            // 
            this.button9.BackColor = System.Drawing.Color.Black;
            this.button9.FlatAppearance.BorderSize = 0;
            this.button9.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button9.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.button9.Location = new System.Drawing.Point(141, 103);
            this.button9.Name = "button9";
            this.button9.Size = new System.Drawing.Size(60, 60);
            this.button9.TabIndex = 21;
            this.button9.Text = "9";
            this.button9.UseVisualStyleBackColor = true;
            this.button9.Click += new System.EventHandler(this.ButtonClick);
            // 
            // button8
            // 
            this.button8.BackColor = System.Drawing.Color.Black;
            this.button8.FlatAppearance.BorderSize = 0;
            this.button8.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button8.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.button8.Location = new System.Drawing.Point(75, 103);
            this.button8.Name = "button8";
            this.button8.Size = new System.Drawing.Size(60, 60);
            this.button8.TabIndex = 20;
            this.button8.Text = "8";
            this.button8.UseVisualStyleBackColor = true;
            this.button8.Click += new System.EventHandler(this.ButtonClick);
            // 
            // button7
            // 
            this.button7.BackColor = System.Drawing.Color.Black;
            this.button7.FlatAppearance.BorderSize = 0;
            this.button7.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button7.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.button7.Location = new System.Drawing.Point(9, 103);
            this.button7.Name = "button7";
            this.button7.Size = new System.Drawing.Size(60, 60);
            this.button7.TabIndex = 19;
            this.button7.Text = "7";
            this.button7.UseVisualStyleBackColor = false;
            this.button7.Click += new System.EventHandler(this.ButtonClick);
            // 
            // secondLabel
            // 
            this.secondLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.secondLabel.ForeColor = System.Drawing.Color.Gray;
            this.secondLabel.Location = new System.Drawing.Point(233, 9);
            this.secondLabel.Name = "secondLabel";
            this.secondLabel.Size = new System.Drawing.Size(165, 28);
            this.secondLabel.TabIndex = 25;
            this.secondLabel.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // button0
            // 
            this.button0.BackColor = System.Drawing.Color.Black;
            this.button0.FlatAppearance.BorderSize = 0;
            this.button0.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button0.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.button0.ForeColor = System.Drawing.Color.White;
            this.button0.Location = new System.Drawing.Point(75, 301);
            this.button0.Name = "button0";
            this.button0.Size = new System.Drawing.Size(60, 60);
            this.button0.TabIndex = 2;
            this.button0.Text = "0";
            this.button0.UseVisualStyleBackColor = false;
            this.button0.Click += new System.EventHandler(this.ButtonClick);
            // 
            // Form1
            // 
            this.BackColor = System.Drawing.SystemColors.ControlText;
            this.ClientSize = new System.Drawing.Size(407, 368);
            this.Controls.Add(this.secondLabel);
            this.Controls.Add(this.buttonPoint);
            this.Controls.Add(this.buttonSqrt2);
            this.Controls.Add(this.buttonSin);
            this.Controls.Add(this.button9);
            this.Controls.Add(this.button8);
            this.Controls.Add(this.button7);
            this.Controls.Add(this.buttonClean);
            this.Controls.Add(this.buttonSqrt3);
            this.Controls.Add(this.buttonCos);
            this.Controls.Add(this.button6);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.buttonDegree);
            this.Controls.Add(this.buttonTan);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.buttonAcos);
            this.Controls.Add(this.buttonEqual);
            this.Controls.Add(this.buttonCot);
            this.Controls.Add(this.buttonNextMem);
            this.Controls.Add(this.button0);
            this.Controls.Add(this.mainLable);
            this.Controls.Add(this.buttonLastMem);
            this.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.Label mainLable;
        private System.Windows.Forms.Button buttonLastMem;
        private System.Windows.Forms.Button buttonNextMem;
        private System.Windows.Forms.Button buttonCot;
        private System.Windows.Forms.Button buttonTan;
        private System.Windows.Forms.Button buttonDegree;
        private System.Windows.Forms.Button buttonEqual;
        private System.Windows.Forms.Button buttonAcos;
        private System.Windows.Forms.Button buttonSqrt3;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button buttonClean;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button buttonCos;
        private System.Windows.Forms.Button button6;
        private System.Windows.Forms.Button buttonPoint;
        private System.Windows.Forms.Button buttonSqrt2;
        private System.Windows.Forms.Button buttonSin;
        private System.Windows.Forms.Button button9;
        private System.Windows.Forms.Button button8;
        private System.Windows.Forms.Button button7;
        private System.Windows.Forms.Label secondLabel;
        private System.Windows.Forms.Button button0;
    }
}