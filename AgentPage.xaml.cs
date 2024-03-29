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
    /// Логика взаимодействия для AgentPage.xaml
    /// </summary>
    public partial class AgentPage : Page
    {
        int CountRecords,CountPage,CurrentPage = 0;
        List<Agent> CurrentPageList = new List<Agent>();
        List<Agent> TableList;

        public void ChangePage(int direction,int? selectedPage) {
            CurrentPageList.Clear();
            CountRecords = TableList.Count;
            if (CountRecords % 10 > 0) CountPage = CountRecords / 10 + 1;
            else CountPage = CountRecords / 10;

            Boolean IfUpdate = true;
            int min;
            if (selectedPage.HasValue)
            {
                if( selectedPage >= 0 && selectedPage <= CountPage)
                {
                    CurrentPage = (int)selectedPage;
                    min = CurrentPage * 10 + 10 < CountRecords ? CurrentPage * 10 + 10 : CountRecords;
                    for(int i = CurrentPage * 10; i < min; i++)
                    {
                        CurrentPageList.Add(TableList[i]);
                    }
                }
            }
            else
            {
                switch (direction)
                {
                    case 1:
                        if (CurrentPage > 0)
                        {
                            CurrentPage--;
                            min = CurrentPage * 10 + 10 < CountRecords ? CurrentPage * 10 + 10 : CountRecords;
                            for (int i = CurrentPage * 10; i < min; i++)
                            {
                                CurrentPageList.Add(TableList[i]);
                            }
                        }
                        else IfUpdate = false;
                        break;
                    case 2:
                        if (CurrentPage < CountPage-1)
                        {
                            CurrentPage++;
                            min = CurrentPage * 10 + 10 < CountRecords ? CurrentPage * 10 + 10 : CountRecords;
                            for (int i = CurrentPage * 10; i < min; i++)
                            {
                                CurrentPageList.Add(TableList[i]);
                            }
                        }
                        else IfUpdate = false;

                        break;
                        
                }
            }
                if (IfUpdate)
                {
                    PageListBox.Items.Clear();
                    for (int i = 1; i <= CountPage; i++)
                    {
                        PageListBox.Items.Add(i);
                    }
                    min = CurrentPage * 10 + 10 < CountRecords ? CurrentPage * 10 + 10 : CountRecords;

                    RecordsTB.Text = min.ToString() + " из " + CountRecords.ToString();
                    PageListBox.SelectedIndex = CurrentPage;
                    AgentsListView.ItemsSource = CurrentPageList;
                AgentsListView.Items.Refresh();
                }

        }

        public AgentPage()
        {
            InitializeComponent();
            CBFilter.SelectedIndex = 0;
            CBSort.SelectedIndex = 0;
            var currentAgent = Zelentsov_eyesEntities.GetContext().Agent.ToList();
            AgentsListView.ItemsSource = currentAgent;
            updateservices();
        }

        public void updateservices()
        {
            var currentAgent = Zelentsov_eyesEntities.GetContext().Agent.ToList();


            //< TextBlock > По возрастанию наименования</ TextBlock > 1 
            //               < TextBlock > По убыванию наименования</ TextBlock > 2 
            //                  < TextBlock > По(nw)возрастанию размера скидки </ TextBlock > 3 
            //                    < TextBlock > По(nw)убыванию размера скидки </ TextBlock > 4 
            //                      < TextBlock > По возрастанию приоритета агента </ TextBlock > 5
            //                         < TextBlock > По убыванию приоритета агента </ TextBlock > 6

            //              ЗАО
            //              МКК
            //              МФО
            //              ОАО
            //              ООО
            //              ПАО
            //TBSearch.Text = CBFilter.Text.ToString(); 
            //currentAgent = currentAgent.Where(p => p.AgentTypeName.ToString() == CBFilter.Text.ToString()).ToList();
            switch (CBFilter.SelectedIndex)
            {
                case 0:
                    break;
                case 1:
                    currentAgent = currentAgent.Where(p => p.AgentTypeName.ToString() == "ЗАО").ToList();
                    break;
                case 2:
                    currentAgent = currentAgent.Where(p => p.AgentTypeName.ToString() == "МКК").ToList();
                    break;
                case 3:
                    currentAgent = currentAgent.Where(p => p.AgentTypeName.ToString() == "МФО").ToList();
                    break;
                case 4:
                    currentAgent = currentAgent.Where(p => p.AgentTypeName.ToString() == "ОАО").ToList();
                    break;
                case 5:
                    currentAgent = currentAgent.Where(p => p.AgentTypeName.ToString() == "ООО").ToList();
                    break;
                case 6:
                    currentAgent = currentAgent.Where(p => p.AgentTypeName.ToString() == "ПАО").ToList();
                    break;
            }
            
            switch (CBSort.SelectedIndex)
            {
                case 0:
                    break;
                case 1:
                    currentAgent = currentAgent.OrderBy(p => p.Title).ToList();
                    break;
                case 2:
                    currentAgent = currentAgent.OrderByDescending(p => p.Title).ToList();
                    break;
                case 5:
                    currentAgent = currentAgent.OrderBy(p => p.Priority).ToList();
                    break;
                case 6:
                    currentAgent = currentAgent.OrderByDescending(p => p.Priority).ToList();
                    break;
            }

            
            currentAgent = currentAgent.Where(p =>
            p.Title.ToLower().Contains(TBSearch.Text.ToLower())
            || p.Phone.Replace("+7", "8").Replace("(", "").Replace(")", "").Replace(" ", "").Replace("-", "")
            .Contains(TBSearch.Text.Replace("+7", "8").Replace("(", "").Replace(")", "").Replace(" ", "").Replace("-", ""))
            || p.Email.ToLower().Contains(TBSearch.Text.ToLower())).ToList();

            AgentsListView.ItemsSource = currentAgent;
            TableList = currentAgent;
            ChangePage(0,0);
        }

        private void TBSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            updateservices();
        }

        private void RightDirBtn_Click(object sender, RoutedEventArgs e)
        {
            ChangePage(2, null);

        }

        private void LeftDirBtn_Click(object sender, RoutedEventArgs e)
        {
            ChangePage(1, null);
        }

        private void PageListBox_MouseUp(object sender, MouseButtonEventArgs e)
        {
            ChangePage(0, Convert.ToInt32(PageListBox.SelectedItem.ToString()) - 1);
        }


        private void CBSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            updateservices();
        }

        

        private void Grid_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            updateservices();
        }


        private void AgentsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(AgentsListView.SelectedItems.Count > 1)
            {
                ChangePrBtn.Visibility = Visibility.Visible;
            }
            else
            {
                ChangePrBtn.Visibility = Visibility.Hidden;
            }
        }

        private void ChangePrBtn_Click(object sender, RoutedEventArgs e)
        {
            int max = 0;
            foreach (Agent agent in AgentsListView.SelectedItems)
            {
                if(max < agent.Priority) max = agent.Priority;
            }
            PriorityWindow window = new PriorityWindow(max);
            window.ShowDialog();
            if (string.IsNullOrEmpty(window.PriorityTb.Text))
            {
                return;
            }
            MessageBox.Show(window.PriorityTb.Text);
            foreach (Agent AgentLV in AgentsListView.SelectedItems)
            {
                AgentLV.Priority = Convert.ToInt32(window.PriorityTb.Text);
            }
            try
            {
                Zelentsov_eyesEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
            updateservices();
        }

        private void CBFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            updateservices();
        }
        private void addBtn_Click(object sender, RoutedEventArgs e)
        {
            FrameSetter.iFrame.Navigate(new AddEditPage());
        }
        private void EditButton_Click(object sender, RoutedEventArgs e) {
            FrameSetter.iFrame.Navigate(new AddEditPage((sender as Button).DataContext as Agent));
        }
    }
}
