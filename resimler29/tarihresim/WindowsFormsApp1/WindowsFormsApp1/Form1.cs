using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DllMesajKutusu;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MesajKutum.MesajGöster("Mesaj Kutum", MessageBoxButtons.OK, MessageBoxIcon.Question);
            
         
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MesajKutum.MesajGöster("Kayıtları Silmek İstiyormusunz", MessageBoxButtons.YesNo, MessageBoxIcon.Stop);
        }
    }
}
