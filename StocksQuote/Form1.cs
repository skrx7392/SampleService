using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace StocksQuote
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void getQuoteButton_Click(object sender, EventArgs e)
        {
            string returnString;
            ServiceReference1.Service1Client client = new ServiceReference1.Service1Client();
            returnString = client.GetData(stockSymbol.Text);
            label1.Text = returnString;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            var path = Directory.GetParent(Directory.GetCurrentDirectory());
            var reader = new StreamReader(File.OpenRead(Directory.GetParent(path.ToString()) + "\\companylist.csv"));
            List<string> symbolList = new List<string>();
            while(!reader.EndOfStream)
            {
                var line = reader.ReadLine();
                String[] values = line.Split(',');
                values[0] = values[0].Remove(0, 1);
                values[0] = values[0].Remove(values[0].Length - 1, 1);
                if(values[0].ToUpper() != "SYMBOL")
                {
                    symbolList.Add(values[0].Trim());
                }
            }
            symbolList.Sort();
            stockSymbol.DataSource = symbolList;
        }
    }
}
