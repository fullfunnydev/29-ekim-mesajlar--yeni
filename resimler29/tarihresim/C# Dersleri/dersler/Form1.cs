using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Text.RegularExpressions;
using DllMesajKutusu;

namespace dersler
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            label25.Text = kasaToplamTutari.ToString();
            label31.Text = "0";
            label30.Text = "0";
            label29.Text = "0";
            label28.Text = "0";
            comboBox3.Items.Add("Mavi");
            comboBox3.Items.Add("Kırmızı");
            comboBox3.Items.Add("Sarı");
            comboBox3.Items.Add("Siyah");
            comboBox3.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            pictureBox2.BackColor = Color.Orange;

        }
        public static bool sayimi(string deger, string deger2)
        {
            try
            {
                int.Parse(deger);
                int.Parse(deger2);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool sayimiRakammi(string deger1, string deger2, string deger3)
        {


            try
            {
                int.Parse(deger1);
                int.Parse(deger2);
                int.Parse(deger3);
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (sayimi(textBox1.Text, textBox2.Text))
            {
                int sayi1, sayi2;
                double bölüm1, bölüm2, bölüm3;
                sayi1 = Convert.ToInt32(textBox1.Text);
                sayi2 = Convert.ToInt32(textBox2.Text);
                label5.Text = Convert.ToString(sayi1 + sayi2);
                label6.Text = Convert.ToString(sayi1 - sayi2);
                label7.Text = Convert.ToString(sayi1 * sayi2);

                bölüm1 = Convert.ToDouble(textBox1.Text);
                bölüm2 = Convert.ToDouble(textBox2.Text);
                bölüm3 = bölüm1 / bölüm2;
                label8.Text = bölüm3.ToString("0.00");



            }
            else
            {
                MessageBox.Show("\nLütfen İşlem Yapmak \n Sayısal değerler giriniz");
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (sayimiRakammi(textBox5.Text, textBox6.Text, textBox7.Text))
            {
                if (textBox3.Text == "" || textBox4.Text == "" || textBox5.Text == "" || textBox6.Text == "" || textBox7.Text == "")
                {
                    MessageBox.Show("Tüm Alanları Doldurunuz");
                }
                else
                {
                    string adi, soyadi;
                    double not1, not2, proje, ortalama;
                    adi = textBox3.Text;
                    soyadi = textBox4.Text;
                    not1 = Convert.ToDouble(textBox5.Text);
                    not2 = Convert.ToDouble(textBox6.Text);
                    proje = Convert.ToDouble(textBox7.Text);
                    ortalama = (not1 + not2 + proje) / 3;
                    listBox1.Items.Add(adi + " " + soyadi + " " + "Ortalaması " + ortalama.ToString("0.00"));

                }
            }
            else
            {

                MessageBox.Show("Sınav Notlarını Rakam Olarak Giriniz");
            }
        }

        public void Temizle()
        {

            textBox3.Text = "";
            textBox4.Text = "";
            textBox5.Text = "";
            textBox6.Text = "";
            textBox7.Text = "";

        }
        private void button3_Click(object sender, EventArgs e)
        {
            Temizle();
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }
        int kasaToplamTutari = 25;
        public int siparisToplamı;

        private void button4_Click(object sender, EventArgs e)
        {
            int mısırFiyati, suFiyati, çayFiyati, biletFiyati;
            mısırFiyati = 22;
            suFiyati = 12;
            çayFiyati = 9;
            biletFiyati = 45;

            if (comboBox1.SelectedItem == "Mısır")
            {
                label36.Text = comboBox2.SelectedItem.ToString();
                int tutarMisir = Convert.ToInt32(label36.Text);
                label31.Text = Convert.ToInt32(tutarMisir * mısırFiyati).ToString();
                label36.Text = "";



            }
            if (comboBox1.SelectedItem == "Su")
            {
                label36.Text = comboBox2.SelectedItem.ToString();
                int tutarSu = Convert.ToInt32(label36.Text);
                label30.Text = Convert.ToInt32(tutarSu * suFiyati).ToString();
                label36.Text = "";


            }
            if (comboBox1.SelectedItem == "Çay")
            {
                label36.Text = comboBox2.SelectedItem.ToString();
                int tutarÇay = Convert.ToInt32(label36.Text);
                label29.Text = Convert.ToString(tutarÇay * çayFiyati);
                label36.Text = "";
            }

            if (comboBox1.SelectedItem == "Bilet")
            {
                label36.Text = comboBox2.SelectedItem.ToString();
                int tutarBilet = Convert.ToInt32(label36.Text);
                label28.Text = Convert.ToString(tutarBilet * biletFiyati);
                label36.Text = "";
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            kasaToplamTutari = kasaToplamTutari + siparisToplamı;
            label25.Text = kasaToplamTutari.ToString("0.00");
            label27.Text = "0.00";

        }

        private void button6_Click(object sender, EventArgs e)
        {
            if (label31.Text == "".ToString() || label30.Text == "".ToString() ||
                label29.Text == "".ToString() || label28.Text == "".ToString())
            {
                MessageBox.Show("Tutarları Giriniz");
            }
            else
            {
                int mısırFişTutari = Convert.ToInt32(label31.Text);
                int suFişTutari = Convert.ToInt32(label30.Text);
                int çayFişTutari = Convert.ToInt32(label29.Text);
                int biletFişTutari = Convert.ToInt32(label28.Text);
                int genelToplam = mısırFişTutari + suFişTutari + çayFişTutari + biletFişTutari;
                siparisToplamı = genelToplam;
                label27.Text = siparisToplamı.ToString("0.00");
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            int girileGünSayisi = Convert.ToInt32(textBox8.Text);

            if (girileGünSayisi == 0 || girileGünSayisi >= 8 || textBox8.Text == string.Empty)
            {
                Form2 hataMesaji = new Form2();
                hataMesaji.Show();
            }
            else
            {
                switch (girileGünSayisi)
                {
                    case 1: label38.Text = "Pazartesi"; break;
                    case 2: label38.Text = "Salı"; break;
                    case 3: label38.Text = "Çarşamba"; break;
                    case 4: label38.Text = "Perşembe"; break;
                    case 5: label38.Text = "Cuma"; break;
                    case 6: label38.Text = "Cumartesi"; break;
                    case 7: label38.Text = "Pazar"; break;

                }
            }
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {


            switch (comboBox3.SelectedIndex)

            {

                case 0:
                    label39.Text = textBox9.Text + " " + textBox10.Text + " " + "Mavi" + " Rengi" + " Huzurun ve Sevginin Rengidir";
                    pictureBox2.BackColor = Color.Blue;
                    label39.ForeColor = Color.Blue;
                    break;
                case 1:
                    label39.Text = textBox9.Text + " " + textBox10.Text + " " + "Kırmızı" + " Rengi" + "Tutkunun Rengidir";
                    pictureBox2.BackColor = Color.Red;
                    label39.ForeColor = Color.Red;
                    break;
                case 2:
                    label39.Text = textBox9.Text + " " + textBox10.Text + " " + "Sarı" + " Rengi" + "Duygusallığın Ve Barışın Rengidir";
                    pictureBox2.BackColor = Color.Yellow;
                    label39.ForeColor = Color.Yellow;
                    break;
                case 3:
                    label39.Text = textBox9.Text + " " + textBox10.Text + " " + "Siyah" + " Rengi" + "Asalet Ve Zarafetin Rengidir";
                    pictureBox2.BackColor = Color.Black;
                    label39.ForeColor = Color.Black;
                    break;

            }
        }

        private void button8_Click(object sender, EventArgs e)
        {
           MesajKutum.MesajGöster("Mesaj YEni Yayında", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}



