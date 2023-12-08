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
using System.Windows.Shapes;

namespace Zelentsov_eyes
{
    /// <summary>
    /// Логика взаимодействия для PriorityWindow.xaml
    /// </summary>
    public partial class PriorityWindow : Window
    {
        public PriorityWindow(int max)
        {
            InitializeComponent();
            PriorityTb.Text = max.ToString();
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrEmpty(PriorityTb.Text))
            {
                Close();
            }
            else
            {
                MessageBox.Show("Введите новый приоритет агентов", "Ошибка");
            }
        }

        private void CloseBtn_Click(object sender, RoutedEventArgs e)
        {
            PriorityTb.Text = "";
            Close();
        }
    }
}
