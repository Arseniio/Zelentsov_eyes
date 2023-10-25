﻿using System;
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
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            FrameSetter.iFrame = MainFrame;
            MainFrame.Navigate(new AgentPage());
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.GoBack();
        }

        private void MainFrame_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (MainFrame.CanGoBack) BackBtn.Visibility = Visibility.Visible;
            else BackBtn.Visibility = Visibility.Hidden;
        }
    }
}