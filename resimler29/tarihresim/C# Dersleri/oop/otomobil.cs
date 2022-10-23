using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace oop
{
    internal class otomobil
    {
        public string Marka { get; set; }
        public string Model { get; set; }
        public int ModelYılı { get; set; }
        public string Renk { get; set; }
        public string VitesTürü { get; set; }

        public string MarkaGetir(string marka,string model,string renk)
        {
            marka = Marka;
            model = Model;
            renk=Renk;
            return marka;
            return model;
            return renk;
        }

    }
}
