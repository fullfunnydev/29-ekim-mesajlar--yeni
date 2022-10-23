using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FormCalısmam
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            panel1.Width = 695;
            panel1.Height = 10;
            timer1.Stop();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            timer1.Start();
            if (button1.Text=="Menüyü Kapat")
            {
                timer2.Start();
            }
           
            
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            panel1.Height++;
            switch (panel1.Height)
            {
                case 20:
                    panel1.BackColor = Color.Black;
                    break;
                case 40:
                    panel1.BackColor = Color.Red;
                    break;
                case 60:
                    panel1.BackColor = Color.Orange;
                    break;
                case 80:
                    panel1.BackColor = Color.Purple;
                    break;
                case 100:
                    panel1.BackColor = Color.Pink;
                    break;
                case 110:
                    panel1.BackColor = Color.Maroon;
                    break;
            }
            if (panel1.Height == 110)
            {
                panel1.Width = 695;
              
                timer1.Stop();
                button1.Text = "Menüyü Kapat";
            }
           
        }

        private void timer2_Tick(object sender, EventArgs e)
        {
            panel1.Height--;
            switch (panel1.Height)
            {
                case 110:
                    panel1.BackColor = Color.Firebrick;
                    break;
                case 100:
                    panel1.BackColor = Color.Red;
                    break;
                case 80:
                    panel1.BackColor = Color.Orange;
                    break;
                case 60:
                    panel1.BackColor = Color.Purple;
                    break;
                case 40:
                    panel1.BackColor = Color.Pink;
                    break;
                case 20:
                    panel1.BackColor = Color.Firebrick;
                    break;
            }
            switch (panel1.Height)
            {   
                case 9:
                    timer2.Stop();
                    button1.Text = "Menüyü Aç";
                    break;
            }
        }

        private void label1_MouseHover(object sender, EventArgs e)
        {
            label1.BackColor = Color.AntiqueWhite;
            label1.Cursor = System.Windows.Forms.Cursors.Hand;
            label1.Font = new System.Drawing.Font("Microsoft Tai Le", 14F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(665, 7);
        }

        private void label1_MouseLeave(object sender, EventArgs e)
        {
            label1.BackColor = Color.White;
            this.label1.Location = new System.Drawing.Point(668, 10);
            label1.Font = new System.Drawing.Font("Microsoft Tai Le", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));

        }

        private void label1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
