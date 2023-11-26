using System.Data.SqlClient;

namespace AddChildren.Data
{
public class AccessData
    {
        string connectionString;

        public AccessData()
        {
            connectionString = AppConfig.GetConnectionString();
        }

        public string AddChild(string topicBody)
        {
            try
            {
                string[] fields = topicBody.Split(',');
                string name = string.Empty;
                string lastname = string.Empty;
                int birthyear = 0;
                string imageUrl = string.Empty;

                foreach (string field in fields)
                {
                    string[] keyValue = field.Split(':');
                    if (keyValue[0].Trim() == "Name")
                        name = keyValue[1].Trim();
                    else if (keyValue[0].Trim() == "Lastname")
                        lastname = keyValue[1].Trim();
                    else if (keyValue[0].Trim() == "Birthyear")
                        birthyear = Convert.ToInt16(keyValue[1].Trim());
                }

                imageUrl = name.ToLower() + lastname.ToLower() + ".jpg";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string sqlQuery = String.Format("INSERT INTO Children (Name, Lastname, Birthyear, ImageUrl) VALUES ('{0}', '{1}', {2}, '{3}')", name, lastname, birthyear, imageUrl);
                    SqlCommand cmd = new SqlCommand(sqlQuery, connection);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }

            return "New child member has been succesfully added";
        }
    }
}