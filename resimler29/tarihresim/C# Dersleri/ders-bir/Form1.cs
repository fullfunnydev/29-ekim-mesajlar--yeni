using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ders_bir
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void MenüyüAc (){

             panel1.Width++;
          
                    if (panel1.Width==159)
                        {
                            timer1.Stop();
                            button1.Text = "Menüyü Kapat";
                            button1.Enabled=true;
                     }
        
        }

        private void MenüyüKApat()
        {
            panel1.Width--;
          
            if (panel1.Width==0)
            {
                timer1.Stop();
                button1.Text = "Menüyü Aç";
                button1.Enabled = true;
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
            timer1.Start();
            panel1.BackColor = Color.Red;
            button1.Enabled = false;
            ButonResimTextAtamasi();
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            panel1.Width = 0;
           
            
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (button1.Text=="Menüyü Aç")
            {
                MenüyüAc();
               
            }
            else
            {
                MenüyüKApat();
                
            }
            
        }
        

    private void ButonResimTextAtamasi()
        {
            button2.Text = "Ekle";
            button2.TextAlign= ContentAlignment.MiddleRight;
            button2.Image = Properties.Resources.ekle;
            button2.ImageAlign = ContentAlignment.MiddleLeft;
            button2.Cursor = System.Windows.Forms.Cursors.Hand;
            //------------------------------------------------
            button3.Text = "Sil";
            button3.TextAlign=ContentAlignment.MiddleRight;
            button3.Image = Properties.Resources.sil;
            button3.ImageAlign= ContentAlignment.MiddleLeft;
            button3.Cursor = System.Windows.Forms.Cursors.Hand;
           

        }

        private void button2_Click(object sender, EventArgs e)
        {
            label1.Text = textBox1.Text;
            label2.Text = textBox2.Text;
            label3.Text = textBox3.Text;
            label4.Text = textBox4.Text;
        }
    }

}
