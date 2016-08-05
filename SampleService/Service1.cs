using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using SampleService.Models;
using System.Collections.ObjectModel;
using SampleService.Helpers;

namespace SampleService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in both code and config file together.
    public class Service1 : IService1
    {
        public ObservableCollection<Quote> Quotes { get; set; }
        public string GetData(string value)
        {
            ObservableCollection<Quote> Quotes = new ObservableCollection<Quote>();
            Quotes.Add(new Quote(value));
            YahooStockEngine.Fetch(Quotes);
            Quote myQuote = Quotes.First();
            return string.Format("Value of " + myQuote.Symbol + ": $" + myQuote.LastTradePrice);
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }
    }
}
