using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Zelentsov_eyes
{
    /// <summary>
    /// Логика взаимодействия для AgentPage.xaml
    /// </summary>
    public partial class AgentPage : Page
    {
        public AgentPage()
        {
            InitializeComponent();
            var currentAgent = Zelentsov_eyesEntities.GetContext().Agent.ToList();
            AgentsListView.ItemsSource = currentAgent;
        }

        public void updateservices()
        {
            var currentAgent = Zelentsov_eyesEntities.GetContext().Agent.ToList();
            currentAgent = currentAgent.Where(p => 
            p.Title.ToLower().Contains(TBSearch.Text.ToLower()) 
            || p.Phone.Contains(TBSearch.Text.ToLower()) 
            || p.Email.ToLower().Contains(TBSearch.Text.ToLower())).ToList();

            AgentsListView.ItemsSource = currentAgent;
        }

        private void TBSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            updateservices();
        }
    }
}
