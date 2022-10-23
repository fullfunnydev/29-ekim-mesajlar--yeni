using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace oop
{
    public partial class Form1 : Form
    {
       
        public Form1()
        {
            InitializeComponent();
        }
       
        private void button1_Click(object sender, EventArgs e)
        { otomobil oto = new otomobil();
           
            oto.Marka = "Citröen";
            oto.Model = "Berlingo";
            oto.ModelYılı = 2022;
            oto.Renk = "Kırmızı";
            oto.VitesTürü = "Otomatik";
            label1.Text = oto.Marka;
            label2.Text = oto.Model;
            label3.Text = oto.ModelYılı.ToString();
            label4.Text = oto.Renk;
            label5.Text = oto.VitesTürü;

            

        }

        private void button2_Click(object sender, EventArgs e)
        {
            otomobil oto = new otomobil();
           label6.Text = oto.MarkaGetir(oto.Marka, oto.Model, oto.Renk);
        }
    }
}
