namespace AddAdult.Data
{
    public class AdultHandler
    {
        public string InsertAdult(string topicBody)
        {
            return new AccessData().AddAdult(topicBody);
        }
    }
}