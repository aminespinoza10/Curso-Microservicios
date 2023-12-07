namespace AddChildren.Data
{
    public class ChildHandler
    {
        public string InsertChild(string topicBody)
        {
            return new AccessData().AddChild(topicBody);
        }
    }
}