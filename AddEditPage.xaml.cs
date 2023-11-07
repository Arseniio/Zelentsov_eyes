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
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {
        private Agent CurrentAgent = new Agent();
        public AddEditPage(Agent SelectedAgent = null)
        {
            InitializeComponent();
            if (SelectedAgent != null)
            {
                this.CurrentAgent = SelectedAgent;
            }
            DataContext = CurrentAgent;
        }

        private void DeleteBtn_Click(object sender, RoutedEventArgs e)
        {
            if (DataContext == null) { return; }
            var saleCount = Zelentsov_eyesEntities.GetContext().ProductSale.ToList().Where(p =>
                CurrentAgent.ID == p.AgentID
            ).ToList().Count;
            if(saleCount != 0)
            {
                MessageBox.Show("Невозможно выполнить удаление,т.к у этого агента существует реализация продукции");
                return;
            }
            if(MessageBox.Show("Вы точно хотите выполнить удаление?","Внимание!",MessageBoxButton.YesNo,MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    Zelentsov_eyesEntities.GetContext().Agent.Remove(CurrentAgent);
                    Zelentsov_eyesEntities.GetContext().SaveChanges();
                    FrameSetter.iFrame.GoBack();
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(CurrentAgent.Title)) 
                errors.AppendLine("Укажите наименование агента");
            if (string.IsNullOrWhiteSpace(CurrentAgent.Address)) 
                errors.AppendLine("Укажите адрес агента");
            if (string.IsNullOrWhiteSpace(CurrentAgent.DirectorName)) 
                errors.AppendLine("Укажите ФИО директора");
            if (TypeCB.SelectedItem == null) 
                errors.AppendLine("Укажите тип агента");
            else
            {
                AgentType id = Zelentsov_eyesEntities.GetContext().AgentType.ToList().Where(p =>
                TypeCB.Text == p.Title
            ).ToList()[0];

                CurrentAgent.AgentTypeID = id.ID;
            }
            if (string.IsNullOrWhiteSpace(CurrentAgent.Priority.ToString())) 
                errors.AppendLine("Укажите приоритет агента");
            if (CurrentAgent.Priority <= 0)
                errors.AppendLine("Укажите положительный приоритет arента"); 
            if (string.IsNullOrWhiteSpace(CurrentAgent.INN))
                errors.AppendLine("Укажите ИНН агента"); 
            if (string.IsNullOrWhiteSpace(CurrentAgent.KPP))
                errors.AppendLine("Укажите КПП агента");
            if (string.IsNullOrWhiteSpace(CurrentAgent.Phone)) 
                errors.AppendLine("Укажите телефон агента");
            else
            {
                string phone = CurrentAgent.Phone.Replace("(", "").Replace("-", "").Replace("+", "");
                if(((phone[1] == '9' || phone[1] == '4' || phone[1] == '8') && phone.Length != 11) || (phone[1] == '3' && phone.Length != 12)){
                    errors.AppendLine("Укажите правильный номер телефона");
                }
            }
            if (string.IsNullOrWhiteSpace(CurrentAgent.Email))
                errors.AppendLine("Укажите почту агента");
            if(errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            if(CurrentAgent.ID == 0)
            {
                Zelentsov_eyesEntities.GetContext().Agent.Add(CurrentAgent);
            }
            try
            {
                Zelentsov_eyesEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена");
                FrameSetter.iFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void ChangeLogoBtn_Click(object sender, RoutedEventArgs e)
        {
        }
    }
}
